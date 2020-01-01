;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'ruby-mode)
(add-hook 'ruby-mode-hook #'lsp-deferred)

(provide '40-ruby-mode)
;;; 40-ruby-mode.el ends here
