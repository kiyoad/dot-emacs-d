;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'helm)
(require 'helm-config)
(require 'helm-files)

(setq recentf-max-saved-items 512)
(require 'recentf-ext)

(require 'bind-key)
(bind-key "C-x C-z" 'helm-resume)
(setq max-specpdl-size 3000)            ; for imenu
(bind-key "C-x C-y" 'helm-semantic-or-imenu)
(bind-key "M-y"     'helm-show-kill-ring)
(bind-key "C-x b"   'helm-multi-files)
(bind-key "C-c C-<SPC>" 'helm-all-mark-rings)

(bind-key "C-z" 'helm-previous-page helm-map)

(defun my-switch-to-buffer-other-window ()
  (interactive)
  (let ((config (current-window-configuration))
        (my-another-window (funcall split-window-preferred-function)))
    (unless (with-local-quit
              (if my-another-window
                  (select-window my-another-window)
                (switch-to-buffer-other-window nil)
                (switch-to-buffer nil))
              (helm-multi-files))
      (set-window-configuration config))))
(bind-key "C-x 4 b" 'my-switch-to-buffer-other-window)

(helm-mode 1)

(provide '20-helm)
;;; 20-helm.el ends here
