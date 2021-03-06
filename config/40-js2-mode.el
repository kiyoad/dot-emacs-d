;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'js)
(require 'js2-mode)
(setq js-indent-level 2)
(setq js2-strict-missing-semi-warning nil)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;;   (add-hook 'js-mode-hook 'js2-minor-mode)

(add-hook 'js2-mode-hook
          '(lambda ()
             (gtags-mode 1)))

(add-hook 'js2-mode-hook #'lsp-deferred)

(provide '40-js2-mode)
;;; 40-js2-mode.el ends here
