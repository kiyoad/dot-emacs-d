;;-*- coding: utf-8 -*-

(require 'ediff)

;; ediffコンントロールパネルを別フレームにしない
(setq ediff-window-setup-function 'ediff-setup-window-plain)
;; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)
