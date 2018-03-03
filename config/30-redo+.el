;;-*- coding: utf-8 -*-

(require 'redo+)
(defun my-undo (prefix)
  (interactive "P")
  (cond
   ((not prefix) (undo))
   (t (redo 1))))

(require 'bind-key)
(bind-key "C-x u" 'my-undo)
(bind-key "C-/" 'my-undo)
(bind-key "C-_" 'my-undo)
