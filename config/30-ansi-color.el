;;-*- coding: utf-8 -*-

(defun display-ansi-colors ()
  (interactive)
  (let ((inhibit-read-only t))
    (ansi-color-apply-on-region (point-min) (point-max))
    (set-buffer-modified-p nil)))
