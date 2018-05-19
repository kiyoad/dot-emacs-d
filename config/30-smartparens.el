;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'smartparens-config)

(smartparens-global-mode +1)
(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)

(require 'bind-key)
(bind-key "C-c t s" 'smartparens-strict-mode)

(provide '30-smartparens)
;;; 30-smartparens.el ends here
