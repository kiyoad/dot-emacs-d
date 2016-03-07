;;-*- coding: utf-8 -*-

(require 'bind-key)
(el-get-bundle fill-column-indicator
  (bind-key "C-c t f" 'fci-mode)
  (with-eval-after-load-feature 'fill-column-indicator
    (setq fci-rule-character ?!)
    (setq fci-rule-color "#808080")))

(add-hook 'python-mode-hook
          '(lambda ()
             (setq fci-rule-column 80)
             (fci-mode 1)))
