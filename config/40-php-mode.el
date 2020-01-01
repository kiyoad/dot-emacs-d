;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'php-mode)
(add-hook 'php-mode-hook #'lsp-deferred)

(provide '40-php-mode)
;;; 40-php-mode.el ends here
