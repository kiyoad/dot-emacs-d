;;-*- coding: utf-8 -*-

(require 'bind-key)
(require 'helm-ag)
(bind-key "M-r" 'helm-ag)
(with-eval-after-load 'helm-ag
  (setq helm-ag-insert-at-point 'symbol))
