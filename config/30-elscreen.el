;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(setq elscreen-prefix-key "\M-]")
(setq elscreen-tab-display-control nil)
(setq elscreen-tab-display-kill-screen nil)

(elscreen-start)

(defun my-switch-to-buffer (prefix)
  "Toggle to recent buffer.
with PREFIX,"
  (interactive "P")
  (cond
   ((not prefix) (switch-to-buffer nil))
   ((equal prefix '(4))
    (cond
     ((elscreen-one-screen-p)
      (elscreen-create))
     (t
      (elscreen-goto (elscreen-get-previous-screen)))))
   (t (helm-elscreen-history))))

(require 'bind-key)
(bind-key* "C-t" 'my-switch-to-buffer)

(provide '30-elscreen)
;;; 30-elscreen.el ends here
