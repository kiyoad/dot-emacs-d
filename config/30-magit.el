;;-*- coding: utf-8 -*-

;; M-x package-install magit
;; M-x package-install git-commit-mode

(my-require 'magit)
(my-require 'git-commit-mode)

;; 新しい magit向け magit-statusの設定
;; http://d.hatena.ne.jp/syohex/20130904/1378310201
(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun my/magit-quit-session ()
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'my/magit-quit-session)

(defadvice git-commit-commit (after move-to-magit-buffer activate)
  (delete-window))

(global-set-key (kbd "C-x v d") 'magit-status)
(global-set-key (kbd "C-x v L") 'magit-key-mode-popup-logging)
(global-set-key (kbd "C-x v z") 'magit-stash)
(global-set-key (kbd "C-x v B") 'magit-branch-manager)
(define-key magit-mode-map (kbd "M-l") 'l-all)

;; M-x package-install mo-git-blame

(my-require 'mo-git-blame)
(global-set-key (kbd "C-x v g") 'mo-git-blame-current)
