;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(global-ace-isearch-mode 1)
(setq ace-isearch-lighter "")
(setq ace-isearch-jump-delay 1.0)
(setq ace-isearch-func-delay 3.0)
;; (setq ace-isearch-input-length 64)

(require 'bind-key)
(bind-key "C-i" 'isearch-dabbrev-expand isearch-mode-map)

(provide '30-ace-isearch)
;;; 30-ace-isearch.el ends here
