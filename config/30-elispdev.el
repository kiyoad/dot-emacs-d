;;-*- coding: utf-8 -*-

(require 'bind-key)
(require 'lispxmp)
(bind-key "C-c C-d" 'lispxmp  emacs-lisp-mode-map)

(set-face-foreground 'font-lock-regexp-grouping-backslash
                     (my-flatui-color "clouds"))
(set-face-background 'font-lock-regexp-grouping-backslash
                     (my-flatui-color "emerald"))
(set-face-foreground 'font-lock-regexp-grouping-construct
                     (my-flatui-color "clouds"))
(set-face-background 'font-lock-regexp-grouping-construct
                     (my-flatui-color "turquoise"))
