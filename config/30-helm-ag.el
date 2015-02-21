;;-*- coding: utf-8 -*-

;; M-x package-install helm-ag

(my-require 'helm-ag)
(setq helm-ag-insert-at-point 'symbol)
(global-set-key (kbd "M-r") 'helm-ag)
