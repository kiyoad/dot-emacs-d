;;-*- coding: utf-8 -*-

(el-get-bundle go-mode)
(add-hook 'go-mode-hook
          '(lambda ()
             (setq my-gtags-command "pygtags")
             (gtags-mode 1)
             (setq tab-width 4)))

(el-get-bundle helm-go-package
  (with-eval-after-load 'go-mode
    (define-key go-mode-map (kbd "C-c C-a") 'helm-go-package)))

(setq my-gopath "/opt/go")

(cond ((file-directory-p my-gopath)
       (add-to-list
        'load-path (concat my-gopath "/src/github.com/nsf/gocode/emacs"))
       (require 'go-autocomplete)
       (add-to-list
        'load-path (concat my-gopath "/src/github.com/dougm/goflymake"))
       (require 'go-flycheck)
       (add-hook 'go-mode-hook 'flycheck-mode)
       (el-get-bundle elpa:go-eldoc     ; use github.com/nsf/gocode
         (add-hook 'go-mode-hook 'go-eldoc-setup))
       (el-get-bundle direx)
       (el-get-bundle
         syohex/emacs-go-direx        ; use github.com/jstemmer/gotags
         (with-eval-after-load 'go-mode
           (define-key go-mode-map (kbd "C-c C-j")
             'go-direx-pop-to-buffer))
         (push '("^\*go-direx:" :regexp t :position left :width 0.4
                 :dedicated t :stick t)
               popwin:special-display-config))
       (el-get-bundle
         dominikh/go-errcheck.el)    ; use github.com/kisielk/errcheck
       (add-hook 'go-mode-hook
                 '(lambda ()    ; use golang.org/x/tools/cmd/goimports
                    (setq gofmt-command "goimports")
                    (add-hook 'before-save-hook 'gofmt-before-save)))
       ))
