;;-*- coding: utf-8 -*-

;;(global-linum-mode t)
;; (set-face-attribute 'linum nil
;;                     :foreground "#800"
;;                     :height 0.9)
(setq linum-format "%5d ")
(add-hook 'prog-mode-hook
          '(lambda ()
             (linum-mode 1)
             (set-face-attribute 'linum nil :height 0.75)))
