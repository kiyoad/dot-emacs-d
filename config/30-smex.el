;;-*- coding: utf-8 -*-

(require 'bind-key)
(el-get-bundle smex
  (smex-initialize)
  (bind-key "M-x" 'smex)
  (bind-key "M-X" 'smex-major-mode-commands))
