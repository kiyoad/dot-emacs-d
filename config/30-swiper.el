;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'swiper)

(defun my-isearch-or-swiper (prefix)
  (interactive "P")
  (if (equal prefix '(16))
      (swiper)
    (isearch-forward prefix)))

(require 'bind-key)
(bind-key "C-s" 'my-isearch-or-swiper)

(setq swiper-include-line-number-in-search t)

(bind-key "C-i" 'isearch-dabbrev-expand isearch-mode-map)

;;; 30-swiper.el ends here
