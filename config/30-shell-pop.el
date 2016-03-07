;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/06/16/shell-pop/

(require 'bind-key)
(el-get-bundle elpa:shell-pop
  (bind-key "C-c c" 'shell-pop))
