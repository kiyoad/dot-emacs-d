;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'go-mode)
(add-hook 'go-mode-hook
          '(lambda ()
             (ggtags-mode 1)
             (setq tab-width 4)))

(require 'bind-key)
(require 'helm-go-package)
(with-eval-after-load 'go-mode
  (bind-key "C-c C-a" 'helm-go-package go-mode-map))

(require 'lsp-clients)
(setq lsp-clients-go-library-directories "/usr/local/go")
(add-hook 'go-mode-hook #'lsp)

(require 'direx)
(require 'go-direx) ; github.com/jstemmer/gotags
(with-eval-after-load 'go-mode
  (bind-key "C-c C-j" 'go-direx-pop-to-buffer go-mode-map))
(require 'popwin)
(push '("^\*go-direx:" :regexp t :position left :width 0.4
        :dedicated t :stick t)
      popwin:special-display-config)

(add-hook 'go-mode-hook
          '(lambda ()    ; use golang.org/x/tools/cmd/goimports
             (setq gofmt-command "goimports")
             (add-hook 'before-save-hook 'gofmt-before-save)))

(provide '40-go-mode)
;;; 40-go-mode.el ends here
