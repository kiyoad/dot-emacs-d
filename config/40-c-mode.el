;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(setq lsp-clients-clangd-executable "/usr/lib/llvm-8/bin/clangd")
(setq company-clang-executable "/usr/bin/clang-8")
(add-hook 'c-mode-hook #'lsp-deferred)
(add-hook 'c++-mode-hook #'lsp-deferred)
(add-hook 'objc-mode-hook #'lsp-deferred)

;; flymake を無効にするのは以下
;; (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))

;; flymake を実行できるようにするためには、
;; Makeflle に以下のような設定が必要
;;
;; check-syntax:
;; 	$(CC) $(CFLAGS) $(ALL_INCS) -Wall -Wextra -fsyntax-only $(CHK_SOURCES)

(provide '40-c-mode.el)
;;; 40-c-mode.el ends here
