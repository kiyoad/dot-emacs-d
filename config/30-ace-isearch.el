;;-*- coding: utf-8 -*-

(require 'ace-isearch)
(global-ace-isearch-mode 1)
(setq ace-isearch-jump-delay 0.5)
(setq ace-isearch-func-delay 2.0)
;; (setq ace-isearch-input-length 64)
(require 'bind-key)
(bind-key "C-i" 'isearch-dabbrev-expand isearch-mode-map)
