;;-*- coding: utf-8 -*-

(setq-default bm-buffer-persistence t)
(setq bm-restore-repository-on-load t)
(setq bm-repository-file (concat user-emacs-directory "bm-repository"))
(el-get-bundle bm)
(require 'bm)
(global-set-key (kbd "M-[") 'bm-previous)
(global-set-key (kbd "M-]") 'bm-next)
;; (global-set-key (kbd "M-/") 'bm-show-all)
(add-hook 'find-file-hook 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(add-hook 'vc-before-checkin-hook 'bm-buffer-save)
(add-hook 'kill-emacs-hook '(lambda nil
                                (bm-buffer-save-all)
                                (bm-repository-save)))

(el-get-bundle s)
(el-get-bundle helm-bm
  (with-eval-after-load-feature 'helm-bm
    (push '(migemo) helm-source-bm)
    (setq helm-source-bm (delete '(multiline) helm-source-bm))))

(defun bm-toggle-or-helm ()
  "2回連続で起動したらhelm-bmを実行させる"
  (interactive)
  (bm-toggle)
  (when (eq last-command 'bm-toggle-or-helm)
    (helm-bm)))
(global-set-key (kbd "M-\\") 'bm-toggle-or-helm)
