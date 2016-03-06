;;-*- coding: utf-8 -*-

;; Mac:
;; sudo port install aspell
;; sudo port install aspell-dict-en

;; Ubuntu:
;; sudo apt-get install aspell

;; ~/.aspell.conf に "lang en_US" を書いておく。

(setq-default ispell-program-name "aspell")
(eval-after-load 'ispell
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

;; look command with auto-complete
(defun my/ac-look ()
  "`look' command with auto-completelook"
  (interactive)
  (unless (executable-find "look")
    (error "Please install `look' command"))
  (let ((cmd (format "look %s" ac-prefix)))
    (with-temp-buffer
      (call-process-shell-command cmd nil t)
      (split-string-and-unquote (buffer-string) "\n"))))

(defun ac-look ()
  (interactive)
  (let ((ac-menu-height 50)
        (ac-candidate-limit t))
  (auto-complete '(ac-source-look))))

(defvar ac-source-look
  '((candidates . my/ac-look)
    (requires . 2)))

(bind-key "C-M-l" 'ac-look)
