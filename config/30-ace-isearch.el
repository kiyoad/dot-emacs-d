;;-*- coding: utf-8 -*-

(el-get-bundle ace-isearch)
(require 'ace-isearch)
(global-ace-isearch-mode 1)

(el-get-bundle isearch-dabbrev
  (define-key isearch-mode-map (kbd "C-i") 'isearch-dabbrev-expand))
