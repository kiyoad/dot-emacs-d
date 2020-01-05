;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

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
 '(package-selected-packages
   (quote
    (doom-modeline doom-themes ccls dap-mode helm-lsp lsp-treemacs php-mode nginx-mode lsp-ui company-lsp lsp-mode git-gutter+ git-gutter-fringe+ rainbow-delimiters color-identifiers-mode dumb-jump swiper ivy flycheck-popup-tip undo-tree eldoc-overlay expand-region trr typit symbol-overlay ace-window origami mwim multiple-cursors goto-chg linum-relative ibuffer-projectile helm-projectile projectile jaword ido-skk focus company elscreen helm-elscreen markdown-toc yasnippet-snippets js2-mode web-mode visual-regexp adoc-mode ansible avy ddskk scratch-pop japanese-holidays bm helm smart-cursor-color prompt-text ietf-docs hiwin go-direx direx helm-go-package mo-git-blame bbyac helm-c-yasnippet browse-kill-ring color-moccur dockerfile-mode fill-column-indicator fold-dwim go-mode google-translate helm-ag helm-google ido-vertical-mode json-mode lispxmp magit markdown-mode migemo pangu-spacing popwin recentf-ext shell-pop smart-newline smart-tab smartparens smex which-key yaml-mode zop-to-char yasnippet shrink-whitespace persp-mode isearch-dabbrev init-loader helm-bm exec-path-from-shell easy-kill bind-key auto-async-byte-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "site-lisp"))

(if (eq window-system 'x)
    (progn
      (require 'doom-themes)
      (require 'doom-modeline)
      (load-theme 'doom-dracula t)
      (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
      (setq doom-modeline-icon nil)
      (setq doom-modeline-major-mode-icon nil)
      (setq doom-modeline-minor-modes nil)
      (add-hook 'after-init-hook #'doom-modeline-mode))
  (load-theme 'misterioso))

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
(setq auto-async-byte-compile-exclude-files-regexp
      "/junk/\\|/config/\\|init.el")

(require 'init-loader)
(init-loader-load (concat user-emacs-directory "config"))

(provide 'init)
;;; init.el ends here
