;;-*- coding: utf-8 -*-

(require 'bind-key)
(el-get-bundle helm-ag
  (bind-key "M-r" 'helm-ag)
  (with-eval-after-load-feature 'helm-ag
    (setq helm-ag-insert-at-point 'symbol)))
