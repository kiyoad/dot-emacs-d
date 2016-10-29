;;-*- coding: utf-8 -*-

(require 'point-undo)
(require 'bind-key)
(bind-key* "C-_" 'point-undo)
(bind-key* "C-M-_" 'point-redo)
