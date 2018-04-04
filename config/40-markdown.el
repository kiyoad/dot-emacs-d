;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'markdown-mode)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(with-eval-after-load 'markdown-mode
  (setq markdown-command-needs-filename t))

(add-hook 'markdown-mode-hook 'pangu-spacing-mode)
(add-hook 'gfm-mode-hook 'pangu-spacing-mode)

(add-to-list 'smart-tab-completion-functions-alist '(markdown-mode . my-hippie-expand))
(add-to-list 'smart-tab-completion-functions-alist '(gfm-mode . my-hippie-expand))

(provide '40-markdown)
;;; 40-markdown.el ends here
