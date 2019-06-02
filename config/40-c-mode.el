;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'ccls)
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'objc-mode-hook #'lsp)

(provide '40-c-mode.el)
;;; 40-c-mode.el ends here
