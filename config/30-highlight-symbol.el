;;-*- coding: utf-8 -*-

(setq highlight-symbol-mode t)
(el-get-bundle highlight-symbol)
(require 'highlight-symbol)
(global-set-key (kbd "C-M-SPC") 'highlight-symbol-at-point)
(global-set-key (kbd "M-(") 'highlight-symbol-prev)
(global-set-key (kbd "M-)") 'highlight-symbol-next)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
(custom-set-faces
 '(highlight-symbol-face ((t (:background "#401000")))))
