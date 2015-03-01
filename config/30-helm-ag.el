;;-*- coding: utf-8 -*-

(el-get-bundle helm-ag
  (global-set-key (kbd "M-r") 'helm-ag)
  (with-eval-after-load-feature 'helm-ag
    (setq helm-ag-insert-at-point 'symbol)))
