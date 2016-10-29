;;-*- coding: utf-8 -*-

;; You can use package-selected-packages to (re)install packages on other machines
;; by running 'package-refresh-contents' and 'package-install-selected-packages'.

(package-initialize)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(package-selected-packages
   (quote
    (point-undo japanese-holidays bm helm smart-cursor-color prompt-text ietf-docs hiwin go-errcheck go-direx direx go-eldoc helm-go-package mo-git-blame bbyac helm-c-yasnippet flycheck-pos-tip ace-isearch auto-complete browse-kill-ring color-moccur dockerfile-mode eldoc-extension fill-column-indicator fold-dwim go-mode google-translate helm-ag helm-google helm-swoop highlight-symbol ido-vertical-mode jedi json-mode lispxmp magit markdown-mode migemo pangu-spacing popwin pos-tip recentf-ext redo+ shell-pop smart-newline smart-tab smartparens smex which-key yafolding yaml-mode zop-to-char yasnippet zenburn-theme shrink-whitespace persp-mode isearch-dabbrev init-loader helm-bm exec-path-from-shell easy-kill bind-key auto-async-byte-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-symbol-face ((t (:background "#0000FF")))))


(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "site-lisp"))

(load-theme 'zenburn t)

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
(setq auto-async-byte-compile-exclude-files-regexp
      "/junk/\\|/config/\\|init.el")

(require 'init-loader)
(init-loader-load (concat user-emacs-directory "config"))
