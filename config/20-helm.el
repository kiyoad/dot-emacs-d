;;-*- coding: utf-8 -*-

;; M-x package-install helm

(my-require 'helm)
(require 'helm-config)
(require 'helm-files)

(global-set-key (kbd "M-x")     'helm-M-x)
(global-set-key (kbd "C-x C-a") 'helm-for-files)
(global-set-key (kbd "C-x C-z") 'helm-resume)
(setq max-specpdl-size 3000)            ; for imenu
(global-set-key (kbd "C-x C-y") 'helm-imenu)
(global-set-key (kbd "M-y")     'helm-show-kill-ring)
(global-set-key (kbd "C-x b")   'helm-buffers-list)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map  (kbd "TAB") 'helm-execute-persistent-action)

(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))
