;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

;; http://rubikitch.com/2015/10/05/helm-c-yasnippet/

(require 'yasnippet)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

(add-to-list 'hippie-expand-try-functions-list
             'yas-hippie-try-expand)

(require 'helm-c-yasnippet)
(setq helm-yas-space-match-any-greedy t)

(require 'bind-key)
(bind-key "C-c y" 'helm-yas-complete)

(yas-global-mode 1)

(provide '30-yasnippet)
;;; 30-yasnippet.el ends here
