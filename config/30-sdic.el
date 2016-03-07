;;-*- coding: utf-8 -*-

(add-to-list 'load-path "/usr/share/emacs/site-lisp/sdic")
(require 'sdic)

(defmacro sdic-set-eiwa-dictionary (dictionary-path)
  `(setq sdic-eiwa-dictionary-list '((sdicf-client ,(eval dictionary-path)))))
(defmacro sdic-set-waei-dictionary (dictionary-path)
  `(setq sdic-waei-dictionary-list '((sdicf-client ,(eval dictionary-path)))))

(cond ((file-directory-p (concat user-emacs-directory "private-sdic"))
       (sdic-set-eiwa-dictionary (concat user-emacs-directory "private-sdic/eiwa.sdic"))
       (sdic-set-waei-dictionary (concat user-emacs-directory "private-sdic/waei.sdic"))
       (setq sdic-default-coding-system 'utf-8-unix))
      (t
       (sdic-set-eiwa-dictionary "/usr/share/dict/gene.sdic")
       (sdic-set-waei-dictionary "/usr/share/dict/jedict.sdic")))

(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)
(require 'bind-key)
(bind-key "C-c w W" 'sdic-describe-word)
(autoload 'sdic-describe-word-at-point
  "sdic" "カーソルの位置の英単語の意味を調べる" t nil)
(bind-key "C-c w w" 'sdic-describe-word-at-point)
(setq sdic-face-color "Yellow")
(setq sdic-window-height 5) ; 検索結果のウィンドウの表示高さ。
(setq sdic-disable-select-window t) ; t だと検索結果ウィンドウに移動しない。

;; sdic-display-buffer 書き換え
(defadvice sdic-display-buffer (around sdic-display-buffer-normalize activate)
  "sdic のバッファ表示を普通にする。"
  (setq ad-return-value (buffer-size))
  (let ((p (or (ad-get-arg 0)
               (point))))
    (and sdic-warning-hidden-entry
         (> p (point-min))
         (message "この前にもエントリがあります。"))
    (goto-char p)
    (display-buffer (get-buffer sdic-buffer-name))
    (set-window-start (get-buffer-window sdic-buffer-name) p)))

(defadvice sdic-other-window (around sdic-other-normalize activate)
  "sdic のバッファ移動を普通にする。"
  (other-window 1))

(defadvice sdic-close-window (around sdic-close-normalize activate)
  "sdic のバッファクローズを普通にする。"
  (bury-buffer sdic-buffer-name))

(push '("*sdic*" :noselect t) popwin:special-display-config)
