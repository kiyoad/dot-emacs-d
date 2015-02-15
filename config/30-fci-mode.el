;;-*- coding: utf-8 -*-

;; M-x package-install fill-column-indicator

(my-require 'fill-column-indicator)

(setq fci-rule-character ?!)
(setq fci-rule-color "#808080")

(global-set-key (kbd "C-c t f") 'fci-mode)

(add-hook 'python-mode-hook
          '(lambda ()
             (setq fci-rule-column 80)
             (fci-mode 1)))
