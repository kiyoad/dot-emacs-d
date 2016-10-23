;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/06/16/shell-pop/

(require 'bind-key)
(require 'shell-pop)
(bind-key "C-c c" 'shell-pop)

(defun shell-pop--switch-to-shell-buffer (index)
  (let ((bufname (shell-pop--shell-buffer-name index)))
    (if (get-buffer bufname)
        (switch-to-buffer bufname)
      (switch-to-buffer bufname)
      (shell bufname)
      (shell-pop--set-exit-action))
    (setq shell-pop-last-shell-buffer-name bufname
          shell-pop-last-shell-buffer-index index)))
