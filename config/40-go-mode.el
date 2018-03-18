;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'go-mode)
(add-hook 'go-mode-hook
          '(lambda ()
             (setq my-gtags-command "pygtags")
             (gtags-mode 1)
             (setq tab-width 4)))

(require 'bind-key)
(require 'helm-go-package)
(with-eval-after-load 'go-mode
  (bind-key "C-c C-a" 'helm-go-package go-mode-map))

(setq my-gopath "/opt/go")

(cond ((file-directory-p my-gopath)
       (add-to-list
        'load-path (concat my-gopath "/src/github.com/nsf/gocode/emacs-company"))
       (require 'company-go)
       (add-to-list
        'load-path (concat my-gopath "/src/github.com/dougm/goflymake"))
       (require 'go-flycheck)
       (add-hook 'go-mode-hook 'flycheck-mode)
       (require 'go-eldoc) ; use github.com/nsf/gocode
       (add-hook 'go-mode-hook 'go-eldoc-setup)
       (require 'direx)
       (require 'go-direx) ; github.com/jstemmer/gotags
       (with-eval-after-load 'go-mode
         (bind-key "C-c C-j" 'go-direx-pop-to-buffer go-mode-map))
       (push '("^\*go-direx:" :regexp t :position left :width 0.4
               :dedicated t :stick t)
             popwin:special-display-config)
       (require 'go-errcheck) ; use github.com/kisielk/errcheck
       (add-hook 'go-mode-hook
                 '(lambda ()    ; use golang.org/x/tools/cmd/goimports
                    (setq gofmt-command "goimports")
                    (add-hook 'before-save-hook 'gofmt-before-save)))
       ))

(provide '40-go-mode)
;;; 40-go-mode.el ends here
