;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/10/05/helm-c-yasnippet/

(el-get-bundle yasnippet)
(el-get-bundle emacs-jp/helm-c-yasnippet
  (setq helm-yas-space-match-any-greedy t))
(global-set-key (kbd "C-c y") 'helm-yas-complete)
(yas-global-mode 1)
