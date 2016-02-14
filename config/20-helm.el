;;-*- coding: utf-8 -*-

(el-get-bundle helm)

(setq recentf-max-saved-items 512)
(el-get-bundle recentf-ext)

(require 'helm)
(require 'helm-config)
(require 'helm-files)

(global-set-key (kbd "M-x")     'helm-M-x)
(global-set-key (kbd "C-x C-z") 'helm-resume)
(setq max-specpdl-size 3000)            ; for imenu
(global-set-key (kbd "C-x C-y") 'helm-semantic-or-imenu)
(global-set-key (kbd "M-y")     'helm-show-kill-ring)
(global-set-key (kbd "C-x b")   'helm-multi-files)
(global-set-key (kbd "C-c C-<SPC>") 'helm-all-mark-rings)
(define-key helm-map (kbd "C-h") 'delete-backward-char)

(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map  (kbd "TAB") 'helm-execute-persistent-action)
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
(global-set-key (kbd "C-x 4 b") 'my-switch-to-buffer-other-window)
