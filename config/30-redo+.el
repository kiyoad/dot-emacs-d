;;-*- coding: utf-8 -*-

(el-get-bundle elpa:redo+
  (require 'redo+)
  (global-set-key (kbd "C-M-/") 'redo)
  (global-set-key (kbd "C-M-_") 'redo))
