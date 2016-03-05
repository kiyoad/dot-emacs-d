;;-*- coding: utf-8 -*-

(el-get-bundle elpa:redo+
  (require 'redo+)
  (bind-key "C-M-/" 'redo)
  (bind-key "C-M-_" 'redo))
