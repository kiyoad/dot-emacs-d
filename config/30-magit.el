;;-*- coding: utf-8 -*-

(el-get-bundle magit
  (global-set-key (kbd "C-x v d") 'magit-status)
  (global-set-key (kbd "C-x v L") 'magit-key-mode-popup-logging)
  (global-set-key (kbd "C-x v z") 'magit-stash)
  (global-set-key (kbd "C-x v B") 'magit-branch-manager)
  (with-eval-after-load-feature 'magit
    (define-key magit-mode-map (kbd "M-l") 'l-all)
    (define-key magit-status-mode-map (kbd "q") 'my/magit-quit-session)))
(el-get-bundle mo-git-blame
  (global-set-key (kbd "C-x v g") 'mo-git-blame-current))

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

(defadvice git-commit-commit (after move-to-magit-buffer activate)
  (delete-window))
