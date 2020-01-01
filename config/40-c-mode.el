;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(add-hook 'c-mode-hook #'lsp-deferred)
(add-hook 'c++-mode-hook #'lsp-deferred)
(add-hook 'objc-mode-hook #'lsp-deferred)

(provide '40-c-mode.el)
;;; 40-c-mode.el ends here
