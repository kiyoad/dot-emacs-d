;;-*- coding: utf-8 -*-

;;(global-linum-mode t)
;; (set-face-attribute 'linum nil
;;                     :foreground "#800"
;;                     :height 0.9)
(setq linum-format "%5d ")

(add-hook 'prog-mode-hook 'linum-mode)
