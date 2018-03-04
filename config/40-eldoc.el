;;-*- coding: utf-8 -*-

(require 'eldoc-extension)
(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'turn-on-eldoc-mode)
(add-hook 'ielm-mode-hook 'turn-on-eldoc-mode)
(with-eval-after-load 'eldoc-extension
  (setq eldoc-idle-delay 0.2)
  (setq eldoc-minor-mode-string ""))