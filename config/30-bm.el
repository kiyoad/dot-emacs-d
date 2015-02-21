;;-*- coding: utf-8 -*-

;; M-x package-install bm

(setq-default bm-buffer-persistence nil)
(setq bm-restore-repository-on-load t)
(setq bm-repository-file (concat user-emacs-directory "bm-repository"))
(my-require 'bm)
(add-hook 'find-file-hook 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
(add-hook 'kill-emacs-hook '(lambda nil
                              (bm-buffer-save-all)
                              (bm-repository-save)))
(global-set-key (kbd "M-[")   'bm-previous)
(global-set-key (kbd "M-]")   'bm-next)
;;(global-set-key (kbd "M-/")   'bm-show-all)

(my-require 'helm-bm)
(push '(migemo) helm-source-bm)
(setq helm-source-bm (delete '(multiline) helm-source-bm))

(defun bm-toggle-or-helm ()
  "2回連続で起動したらhelm-bmを実行させる"
  (interactive)
  (bm-toggle)
  (when (eq last-command 'bm-toggle-or-helm)
    (helm-bm)))
(global-set-key (kbd "M-SPC") 'bm-toggle-or-helm)