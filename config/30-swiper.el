;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'swiper)
(require 'bind-key)
(bind-key "C-r" 'swiper)

(setq swiper-include-line-number-in-search t)

(bind-key "C-i" 'isearch-dabbrev-expand isearch-mode-map)

;;; 30-swiper.el ends here
