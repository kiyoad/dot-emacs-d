;;-*- coding: utf-8 -*-

;; M-x package-install smart-newline
(my-require 'smart-newline)
(add-hook 'emacs-lisp-mode-hook 'smart-newline-mode)
(add-hook 'lisp-interaction-mode-hook 'smart-newline-mode)
(add-hook 'lisp-mode-hook 'smart-newline-mode)
(add-hook 'ielm-mode-hook 'smart-newline-mode)
(add-hook 'python-mode-hook 'smart-newline-mode)
(add-hook 'c-mode-common-hook 'smart-newline-mode)
