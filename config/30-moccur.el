;;-*- coding: utf-8 -*-

(el-get-bundle color-moccur
  (with-eval-after-load-feature 'color-moccur
    (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
    (setq moccur-split-word t)))
