;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'ccls)
(setq ccls-args '("--init={\"index\": {\"initialBlacklist\": [\".\"], \"threads\":0}}"))
(setq ccls-sem-highlight-method 'font-lock)
(ccls-use-default-rainbow-sem-highlight)

;; When some C source files are automatically read at startup by
;; persp-mode, indexing of those files by ccls is performed in a
;; burst, so it waits for a long time until startup is completed.

;; Therefore, lsp-mode for C source files are performed manually for
;; each file.

;; (add-hook 'c-mode-hook #'lsp)
;; (add-hook 'c++-mode-hook #'lsp)
;; (add-hook 'objc-mode-hook #'lsp)

(provide '40-c-mode.el)
;;; 40-c-mode.el ends here
