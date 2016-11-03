;;-*- coding: utf-8 -*-

(require 'bind-key)
(require 'fill-column-indicator)
(bind-key "C-c t f" 'fci-mode)
(with-eval-after-load 'fill-column-indicator
  (setq fci-rule-character ?!)
  (setq fci-rule-color (my-flatui-color "asbestos")))

(add-hook 'python-mode-hook
          '(lambda ()
             (setq fci-rule-column 80)
             (fci-mode 1)))
