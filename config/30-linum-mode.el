;;-*- coding: utf-8 -*-

;;(global-linum-mode t)
;; (set-face-attribute 'linum nil
;;                     :foreground "#800"
;;                     :height 0.9)
(setq linum-format "%5d ")

(add-hook 'emacs-lisp-mode-hook 'linum-mode)
(add-hook 'lisp-interaction-mode-hook 'linum-mode)
(add-hook 'lisp-mode-hook 'linum-mode)
(add-hook 'ielm-mode-hook 'linum-mode)
(add-hook 'python-mode-hook 'linum-mode)
(add-hook 'c-mode-common-hook 'linum-mode)

