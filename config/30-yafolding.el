;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/09/17/yafolding/

;; C-RET
;;   現在位置以下を隠す・見せる
;; C-M-RET
;;   トップレベル以外を隠す・見せる
;; C-S-RET
;;   現在位置を含む階層を隠す

(require 'yafolding)
(add-hook 'prog-mode-hook 'yafolding-mode)
