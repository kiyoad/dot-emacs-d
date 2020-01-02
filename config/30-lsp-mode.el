;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'lsp-mode)
(require 'lsp-ui)
(require 'company-lsp)

(setq lsp-ui-peek-always-show t)
(setq lsp-ui-doc-header t)
(setq lsp-ui-doc-include-signature t)
(setq lsp-auto-guess-root t)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(push 'company-lsp company-backends)

(provide '30-lsp-mode)
;;; 30-lsp-mode.el ends here
