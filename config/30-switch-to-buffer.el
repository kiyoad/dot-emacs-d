;;-*- coding: utf-8 -*-

(winner-mode 1)
(defun my-switch-to-buffer (prefix)
  (interactive "P")
  (cond
   ((not prefix) (switch-to-buffer nil))
   ((equal prefix '(4))
    (progn
      (winner-undo)
      (setq this-command 'winner-undo)))
   ((equal prefix '(16)) (winner-redo))
   (t (ibuffer))))

(require 'bind-key)
(bind-key* "C-t" 'my-switch-to-buffer)
