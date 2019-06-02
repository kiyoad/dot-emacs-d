;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'lsp-mode)
(require 'lsp-ui)
(require 'company-lsp)

(add-to-list 'lsp-language-id-configuration '(sh-mode . "bash"))

(provide '30-lsp-mode)
;;; 30-lsp-mode.el ends here
