;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(setq-default bm-buffer-persistence t)
(setq bm-restore-repository-on-load t)
(setq bm-repository-file (concat user-emacs-directory "bm-repository"))
(require 'bm)
(require 'bind-key)
(bind-key "M-g M-p" 'bm-previous)
(bind-key "M-g M-n" 'bm-next)
;; (global-set-key (kbd "M-/") 'bm-show-all)
(add-hook 'find-file-hook 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
(add-hook 'kill-emacs-hook '(lambda nil
                                (bm-buffer-save-all)
                                (bm-repository-save)))

(require 'helm-bm)
(push '(migemo) helm-source-bm)
(setq helm-source-bm (delete '(multiline) helm-source-bm))
(require 'helm-for-files)
(add-to-list 'helm-for-files-preferred-list 'helm-source-bm)

(defun bm-toggle-or-helm ()
  "2回連続で起動したらhelm-bmを実行させる"
  (interactive)
  (bm-toggle)
  (when (eq last-command 'bm-toggle-or-helm)
    (helm-bm)))
(bind-key "M-\\" 'bm-toggle-or-helm)

(provide '30-bm)
;;; 30-bm.el ends here
