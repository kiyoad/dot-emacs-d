;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/10/18/shrink-whitespace/

(el-get-bundle shrink-whitespace)
(require 'bind-key)
(bind-key "M-SPC" 'shrink-whitespace)
