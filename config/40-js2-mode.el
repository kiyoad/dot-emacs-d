;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(setq js-indent-level 2)
(setq js2-strict-missing-semi-warning nil)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))
;;   (add-hook 'js-mode-hook 'js2-minor-mode)

(provide '40-js2-mode)
;;; 40-js2-mode.el ends here
