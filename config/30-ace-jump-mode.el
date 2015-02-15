;;-*- coding: utf-8 -*-

;; M-x package-install ace-jump-mode

(my-require 'ace-jump-mode)

(defconst ace-jump-mode-move-keys-by-case
  (cons (reverse (append "asdfghjkl;'" nil))
        (reverse (append "asdfghjkl;'qwertyuiop[]zxcvbnm,." nil))))
(defadvice ace-jump-search-candidate (after sort-by-distance activate)
  "距離が近ければ近いほど押しやすいヒント文字を割り当てる"
  (setq ad-return-value
        (loop with cands = (length ad-return-value)
              with homeposition-keys = (length (car ace-jump-mode-move-keys-by-case))
              with keys = (length (cdr ace-jump-mode-move-keys-by-case))
              with fdistance = (lambda (p) (abs (- (point) (or (aj-position-offset p) 0))))
              ;; これらのコマンドで到達できる場所は除外するよう位置を計算しておく
              with exceptions = (loop for func in '(ignore beginning-of-line forward-char backward-word )
                                      collect (save-excursion (ignore-errors (call-interactively func))
                                                              (point)))
              ;; カレントバッファ内の位置はpl-thiswinに
              ;; 他のウィンドウでの位置はpl-otherwinに分ける
              for position in ad-return-value
              if (eq (aj-position-window position) (selected-window))
              ;; 除外する場所に該当しなければ登録
              collect (unless (memq (aj-position-offset position) exceptions) position) into pl-thiswin
              else collect position into pl-otherwin
              finally do
              ;; ヒント文字の数によって場合分け
              ;; 最短距離からasdf～と割り当てる
              (setq ace-jump-mode-move-keys
                    (typecase cands
                      ((integer 2 homeposition-keys)
                       (last (car ace-jump-mode-move-keys-by-case) cands))
                      ((integer homeposition-keys keys)
                       (last (cdr ace-jump-mode-move-keys-by-case) cands))
                      (t
                       (cdr ace-jump-mode-move-keys-by-case))))
              ;; カレントバッファ内の位置を選択しやすくするためにソートする
              (return (append pl-otherwin (sort* (delq nil pl-thiswin) #'> :key fdistance))))))
;; (progn (ad-disable-advice 'ace-jump-search-candidate 'after 'sort-by-distance) (ad-update 'ace-jump-search-candidate))

(global-set-key (kbd "C-o") 'ace-jump-word-mode)
(global-set-key (kbd "M-o") 'ace-jump-mode-pop-mark)


;; helm-occurで現在(近辺)の行を表示させる

(defun helm-after-update-hook--occur-goto-nearest-line ()
  (when (and (string-match "helm.+occur" helm-buffer)
             (not (helm-empty-buffer-p)))
    (let ((lineno (with-helm-current-buffer
                   (line-number-at-pos (car helm-current-position)))))
      (with-helm-window
       (goto-char (point-max))
       (loop with re = (concat "^" (regexp-quote (buffer-name helm-current-buffer)) ":\\([0-9]+\\):")
             while (re-search-backward re nil t)
             for curline = (string-to-number (match-string 1))
             if (<= curline lineno)
             do
             (helm-mark-current-line)
             (helm-execute-persistent-action)
             (return))))))
(add-hook 'helm-after-update-hook 'helm-after-update-hook--occur-goto-nearest-line)

;; C-rとC-sで前後の行を表示させる

(defun helm-occur-search-forward ()
  (interactive)
  (helm-next-line)
  (helm-execute-persistent-action))
(define-key helm-map (kbd "C-s") 'helm-occur-search-forward)

(defun helm-occur-search-previous ()
  (interactive)
  (helm-previous-line)
  (helm-execute-persistent-action))
(define-key helm-map (kbd "C-r") 'helm-occur-search-previous)

;; isearchからhelm-occurへ移行させる

(defun ace-jump-from-isearch ()
  "Invoke `ace-jump' from isearch."
  (interactive)
  (isearch-exit)
  (goto-char isearch-opoint)
  (if ace-jump-current-mode (ace-jump-done))
  (setq ace-jump-current-mode 'ace-jump-char-mode)
  (ace-jump-do (regexp-quote isearch-string)))
(define-key isearch-mode-map (kbd "C-M-s") 'ace-jump-from-isearch)

(defvar isearch-ace-jump-mode-timer nil)
(defvar isearch-ace-jump-mode-interval 0.3)
(defvar helm-auto-occur-from-isearch-max-size 1500000
  "`helm-occur-from-isearch'を発動させる最大のバッファサイズ")

(defun isearch-mode-hook--ace-jump-mode ()
  (when (and (not isearch-ace-jump-mode-timer)
             (not isearch-regexp)
             isearch-ace-jump-mode-interval)
    (run-at-time 3 nil 'set 'ring-bell-function ring-bell-function)
    (setq ring-bell-function 'ignore)
    (setq isearch-ace-jump-mode-timer
          (run-with-idle-timer isearch-ace-jump-mode-interval t
                               'isearch-ace-jump-timer-function))))
(add-hook 'isearch-mode-hook 'isearch-mode-hook--ace-jump-mode)

(defadvice helm-occur-from-isearch (around helm-execute-action-at-once-if-one activate)
  "1つしかマッチしない場合は即ジャンプするよう"
  (let ((helm-execute-action-at-once-if-one t)) ad-do-it))
;; (progn (ad-disable-advice 'helm-occur-from-isearch 'around 'helm-execute-action-at-once-if-one) (ad-update 'helm-occur-from-isearch))

(defun isearch-ace-jump-timer-function ()
  (unless (memq (length isearch-string) '(0 2 3 4 5 6 7))
    (let ((cancel-isearch (lambda ()
                            (isearch-exit)
                            (setq quit-flag t)
                            (run-with-idle-timer 0 nil 'message ""))))
      (isearch-ace-jump-cancel-timer)
;;      (y-or-n-p (concat "last-command-event: " (number-to-string last-command-event)))
      (if (>= last-command-event 32)
          (cond ((eq (length isearch-string) 1)
                 (funcall cancel-isearch)
                 (ace-jump-from-isearch))
                ((< (- (point-max) (point-min)) helm-auto-occur-from-isearch-max-size)
                 (funcall cancel-isearch)
                 (run-with-idle-timer 0 nil 'helm-occur-from-isearch)))))))

(defun isearch-ace-jump-cancel-timer ()
  (when isearch-ace-jump-mode-timer
    (cancel-timer isearch-ace-jump-mode-timer)
    (setq isearch-ace-jump-mode-timer nil)))
(add-hook 'isearch-mode-end-hook 'isearch-ace-jump-cancel-timer)

;; (defun anything-occur-x-from-isearch ()
;;   (isearch-exit)
;;   (run-with-idle-timer 0 nil 'anything-occur-x isearch-string))

;; 日本語における「単語」を設定する

;;; steal from evil-vars.el
(setq word-combining-categories
      '( ;; default value in word-combining-categories
        (nil . ?^) (?^ . nil)
        ;; Roman
        (?r . ?k) (?r . ?A) (?r . ?G)
        ;; half-width Katakana
        (?k . ?r) (?k . ?A) (?k . ?G)
        ;; full-width alphanumeric
        (?A . ?r) (?A . ?k) (?A . ?G)
        ;; full-width Greek
        (?G . ?r) (?G . ?k) (?G . ?A)
        ))
(setq word-separating-categories
      '( ;; Kanji
        (?C . ?H) (?C . ?K) (?C . ?k) (?C . ?A) (?C . ?G)
        ;; Hiragana
        (?H . ?C) (?H . ?K) (?H . ?k) (?H . ?A) (?H . ?G)
        ;; Katakana
        (?K . ?C) (?K . ?H) (?K . ?k) (?K . ?A) (?K . ?G)
        ;; half-width Katakana
        (?k . ?C) (?k . ?H) (?k . ?K)   ; (?k . ?A) (?k . ?G)
        ;; full-width alphanumeric
        (?A . ?C) (?A . ?H) (?A . ?K)   ; (?A . ?k) (?A . ?G)
        ;; full-width Greek
        (?G . ?C) (?G . ?H) (?G . ?K)   ; (?G . ?k) (?G . ?A)
        ))

(defun ace-jump-prog-mode ()
  (interactive)
  (ace-jump-do "\\_<.\\|\\s("))
(defun prog-mode-hook--ace-jump-prog-mode ()
  (local-set-key (kbd "C-o") 'ace-jump-prog-mode))
(add-hook 'prog-mode-hook 'prog-mode-hook--ace-jump-prog-mode)

(custom-set-faces
 '(ace-jump-face-background ((t (:foreground "magenta"))))
 '(ace-jump-face-foreground ((t (:foreground "yellow")))))
