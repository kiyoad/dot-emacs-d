;;-*- coding: utf-8 -*-

;; M-x package-install highlight-symbol

(my-require 'highlight-symbol)
(global-set-key (kbd "C-M-SPC") 'highlight-symbol-at-point)
;; (global-set-key [f3] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
