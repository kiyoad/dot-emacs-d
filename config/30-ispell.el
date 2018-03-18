;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

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
(require 'auto-complete)
(defun my-ac-source ()
  "`look' command with auto-completelook."
  (interactive)
  (unless (executable-find "look")
    (error "Please install `look' command"))
  (let ((cmd (format "look %s" ac-prefix)))
    (with-temp-buffer
      (call-process-shell-command cmd nil t)
      (split-string-and-unquote (buffer-string) "\n"))))

(defun my-ac-look ()
  "My auto-complete look."
  (interactive)
  (let ((ac-menu-height 50)
        (ac-candidate-limit t))
    (unless auto-complete-mode
      (auto-complete-mode))
    (auto-complete '(ac-source-look))))

(defvar ac-source-look
  '((candidates . my-ac-source)
    (requires . 2)))

(require 'bind-key)
(bind-key "C-c w l" 'my-ac-look)

(provide '30-ispell)
;;; 30-ispell.el ends here
