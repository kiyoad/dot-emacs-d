;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'lsp-mode)
(require 'lsp-ui)
(require 'company-lsp)

(add-to-list 'lsp-language-id-configuration '(sh-mode . "bash"))
(setq lsp-prefer-flymake nil)
(setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
(setq lsp-ui-peek-always-show t)
(setq lsp-ui-doc-header t)
(setq lsp-ui-doc-include-signature t)

(provide '30-lsp-mode)
;;; 30-lsp-mode.el ends here
