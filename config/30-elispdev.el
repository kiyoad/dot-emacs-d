;;-*- coding: utf-8 -*-

(require 'bind-key)
(el-get-bundle lispxmp
  (bind-key "C-c C-d" 'lispxmp  emacs-lisp-mode-map))

(set-face-foreground 'font-lock-regexp-grouping-backslash "green3")
(set-face-foreground 'font-lock-regexp-grouping-construct "green")
