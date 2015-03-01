;;-*- coding: utf-8 -*-

(el-get-bundle migemo
  (with-eval-after-load-feature 'migemo
    (setq migemo-command "cmigemo")
    (setq migemo-options '("-q" "--emacs"))
    (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
    (setq migemo-user-dictionary nil)
    (setq migemo-regex-dictionary nil)
    (setq migemo-coding-system 'utf-8-unix)
    (setq migemo-isearch-enable-p nil)      ; default MIGEMO off
    (load-library "migemo")
    (migemo-init)))
