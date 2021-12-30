;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'json-mode)
;; (require 'json-reformat)
(add-hook 'json-mode-hook #'lsp-deferred)

(provide '40-json)
;;; 40-json.el ends here
