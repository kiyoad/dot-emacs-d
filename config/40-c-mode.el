;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

;; ccls を使う場合は以下を無効にする
;; (setq lsp-clients-clangd-executable "/usr/lib/llvm-8/bin/clangd")

(require 'ccls)
(setq ccls-executable "/usr/local/bin/ccls")

(setq company-clang-executable "/usr/bin/clang-8")
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'objc-mode 'cuda-mode)
              (flycheck-mode -1)
              (lsp-deferred))
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (gtags-mode 1))))

;; flycheck を使う場合は以下を有効にする。
;; (setq lsp-prefer-flymake nil)
;; (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
;; flycheck でも結局はinclude pathの問題がある。

;; flymake を実行できるようにするためには、
;; Makeflle に以下のような設定が必要
;;
;; check-syntax:
;; 	$(CC) $(CFLAGS) $(ALL_INCS) -Wall -Wextra -fsyntax-only $(CHK_SOURCES)

(require 'bind-key)
(bind-key "C-c l h m" 'ccls-member-hierarchy lsp-mode-map)
(bind-key "C-c l h c" 'ccls-call-hierarchy lsp-mode-map)
(bind-key "C-c l h i" 'ccls-inheritance-hierarchy lsp-mode-map)

(provide '40-c-mode.el)
;;; 40-c-mode.el ends here
