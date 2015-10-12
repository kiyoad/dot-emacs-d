;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/10/07/highlight-symbol/

(el-get-bundle highlight-symbol)
(setq highlight-symbol-idle-delay 1.0)
(global-set-key (kbd "M-s h R") 'highlight-symbol-query-replace)
(custom-set-faces
 '(highlight-symbol-face ((t (:background "#0000FF")))))
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
