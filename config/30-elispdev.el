;;-*- coding: utf-8 -*-

;; M-x package-install lispxmp
(my-require 'lispxmp)
(define-key emacs-lisp-mode-map (kbd "C-c C-d") 'lispxmp)

(set-face-foreground 'font-lock-regexp-grouping-backslash "green3")
(set-face-foreground 'font-lock-regexp-grouping-construct "green")

(define-key lisp-interaction-mode-map (kbd "C-<return>") 'eval-print-last-sexp)
