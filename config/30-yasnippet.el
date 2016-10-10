;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/10/05/helm-c-yasnippet/

(require 'yasnippet)
(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t)
(require 'bind-key)
(bind-key "C-c y" 'helm-yas-complete)
(yas-global-mode 1)
