;;-*- coding: utf-8 -*-

(el-get-bundle helm)

(setq recentf-max-saved-items 512)
(el-get-bundle recentf-ext)

(require 'helm)
(require 'helm-config)
(require 'helm-files)

(bind-key "M-x"     'helm-M-x)
(bind-key "C-x C-z" 'helm-resume)
(setq max-specpdl-size 3000)            ; for imenu
(bind-key "C-x C-y" 'helm-semantic-or-imenu)
(bind-key "M-y"     'helm-show-kill-ring)
(bind-key "C-x b"   'helm-multi-files)
(bind-key "C-c C-<SPC>" 'helm-all-mark-rings)
(bind-key "C-h" 'delete-backward-char helm-map)

(bind-key "C-h" 'delete-backward-char           helm-find-files-map)
(bind-key "TAB" 'helm-execute-persistent-action helm-find-files-map)
(bind-key "TAB" 'helm-execute-persistent-action helm-read-file-map)
(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
        ad-do-it))

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
