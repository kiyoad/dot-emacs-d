;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(setq elscreen-prefix-key (kbd "C-M-]"))
(setq elscreen-tab-display-control nil)
(setq elscreen-tab-display-kill-screen nil)

(elscreen-start)

(defun my-toggle-to-recent-buffer ()
  "Toggle to recent buffer."
  (interactive)
  (switch-to-buffer nil))

(defun my-toggle-to-recent-elscreen (prefix)
  "Toggle to recent elscreen.
with PREFIX,"
  (interactive "P")
  (cond
   ((not prefix)
    (cond
     ((elscreen-one-screen-p)
      (elscreen-create))
     (t
      (elscreen-goto (elscreen-get-previous-screen)))))
   (t (helm-elscreen-history))))

(require 'bind-key)
(bind-key* "C-t" 'my-toggle-to-recent-buffer)
(bind-key* "M-t" 'my-toggle-to-recent-elscreen)

(provide '30-elscreen)
;;; 30-elscreen.el ends here
