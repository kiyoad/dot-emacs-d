;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'linum)
(setq linum-format "%5d ")
(set-face-attribute 'linum nil :height 0.75)

(require 'bind-key)
(bind-key "C-c t l" 'linum-mode)
(bind-key "C-c t r" 'linum-relative-toggle)

(provide '30-linum-mode)
;;; 30-linum-mode.el ends here
