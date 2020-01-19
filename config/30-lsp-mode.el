;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'lsp-mode)
(require 'lsp-ui)
(require 'company-lsp)

(setq lsp-auto-guess-root t)
(setq lsp-document-sync-method lsp--sync-incremental)
(setq lsp-response-timeout 5)
(setq lsp-ui-peek-always-show t)

(setq lsp-ui-doc-use-webkit t)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-header t)
(setq lsp-ui-doc-include-signature t)
(setq lsp-ui-doc-position 'top)

(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-ignore-duplicate t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-sideline-show-diagnostics nil)
(setq lsp-ui-sideline-show-code-actions nil)

(setq lsp-ui-imenu-enable nil)

(defun ladicle/toggle-lsp-ui-doc ()
  (interactive)
  (if lsp-ui-doc-mode
      (progn
        (lsp-ui-doc-mode -1)
        (lsp-ui-doc--hide-frame))
    (lsp-ui-doc-mode 1)))

(setq company-lsp-cache-candidates t)
(setq company-lsp-enable-recompletion nil)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(push 'company-lsp company-backends)

(require 'bind-key)
(bind-key "C-c l r" 'lsp-ui-peek-find-references lsp-mode-map)
(bind-key "C-c l d" 'lsp-ui-peek-find-definitions lsp-mode-map)
(bind-key "C-c l i" 'lsp-ui-peek-find-implementation lsp-mode-map)
(bind-key "C-c l p" 'xref-pop-marker-stack lsp-mode-map)
(bind-key "C-c l m" 'lsp-ui-imenu lsp-mode-map)
(bind-key "C-c l s" 'lsp-ui-sideline-mode lsp-mode-map)
(bind-key "C-c l u" 'ladicle/toggle-lsp-ui-doc lsp-mode-map)

(provide '30-lsp-mode)
;;; 30-lsp-mode.el ends here
