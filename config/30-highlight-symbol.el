;;-*- coding: utf-8 -*-

;; (setq highlight-symbol-mode t)
(el-get-bundle highlight-symbol)
(require 'highlight-symbol)
;; (global-set-key (kbd "C-M-SPC") 'highlight-symbol-at-point)
(global-set-key (kbd "M-(") 'highlight-symbol-prev)
(global-set-key (kbd "M-)") 'highlight-symbol-next)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)
(custom-set-faces
 '(highlight-symbol-face ((t (:background "#0000FF")))))

(add-hook 'emacs-lisp-mode-hook 'highlight-symbol-mode)
(add-hook 'lisp-interaction-mode-hook 'highlight-symbol-mode)
(add-hook 'lisp-mode-hook 'highlight-symbol-mode)
(add-hook 'ielm-mode-hook 'highlight-symbol-mode)
(add-hook 'python-mode-hook 'highlight-symbol-mode)
(add-hook 'c-mode-common-hook 'highlight-symbol-mode)

