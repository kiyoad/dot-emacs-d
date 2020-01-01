;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'dockerfile-mode)
(add-hook 'dockerfile-mode-hook #'lsp-deferred)

(provide '40-dockerfile-mode)
;;; 40-dockerfile-mode.el ends here
