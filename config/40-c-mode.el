;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'ccls)
(setq ccls-args '("--init={\"index\": {\"initialBlacklist\": [\".\"], \"threads\": 0}}" "--log-file=/tmp/ccls.log" "-v=1"))
(setq ccls-sem-highlight-method 'font-lock)
(ccls-use-default-rainbow-sem-highlight)

;; When some C source files are automatically read at startup by
;; persp-mode, indexing of those files by ccls is performed in a
;; burst, so it waits for a long time until startup is completed.

;; This phenomenon occurs when folder redirection is enabled in
;; xrdp. Therefore, when enabling folder redirection, it is
;; recommended to enable lsp-mode manually.

(add-hook 'c-mode-hook #'lsp-deferred)
(add-hook 'c++-mode-hook #'lsp-deferred)
(add-hook 'objc-mode-hook #'lsp-deferred)

(provide '40-c-mode.el)
;;; 40-c-mode.el ends here
