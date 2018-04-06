;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'redo+)
(defun my-undo (prefix)
  "My undo.
PREFIX ."
  (interactive "P")
  (cond
   ((not prefix) (undo))
   (t (redo 1))))

(require 'bind-key)
(bind-key "C-x u" 'my-undo)
(bind-key "C-/" 'my-undo)

(provide '30-redo+)
;;; 30-redo+.el ends here
