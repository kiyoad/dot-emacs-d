;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(setq lsp-clients-clangd-executable "/usr/lib/llvm-8/bin/clangd")
(setq company-clang-executable "/usr/bin/clang-8")
(add-hook 'c-mode-hook #'lsp-deferred)
(add-hook 'c++-mode-hook #'lsp-deferred)
(add-hook 'objc-mode-hook #'lsp-deferred)

(provide '40-c-mode.el)
;;; 40-c-mode.el ends here
