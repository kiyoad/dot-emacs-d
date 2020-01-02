;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(add-to-list 'lsp-language-id-configuration '(sh-mode . "bash"))
(add-hook 'sh-mode-hook #'lsp-deferred)

(provide '40-sh-mode)
;;; 40-sh-mode.el ends here
