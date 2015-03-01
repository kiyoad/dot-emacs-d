;;-*- coding: utf-8 -*-

(el-get-bundle! smartparens-config in smartparens
  (with-eval-after-load-feature 'smartparens
    (smartparens-global-mode 1)))
