;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2016/02/15/sd1507-builtin/

(require 'bind-key)
(el-get-bundle zop-to-char
  (bind-key "M-z" 'zop-up-to-char))
