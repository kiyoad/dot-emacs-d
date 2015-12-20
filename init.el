;;-*- coding: utf-8 -*-

(set-default-file-modes #o700)

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "site-lisp"))
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(el-get-bundle tarao/with-eval-after-load-feature-el)

(el-get-bundle color-theme-zenburn
  (load-theme 'zenburn t))

(el-get-bundle exec-path-from-shell
  (exec-path-from-shell-initialize))

(el-get-bundle elpa:auto-async-byte-compile)
(require 'auto-async-byte-compile)
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)
(setq auto-async-byte-compile-exclude-files-regexp
      "/junk/\\|/config/\\|init.el\\|/el-get/")

(el-get-bundle init-loader
  (init-loader-load (concat user-emacs-directory "config")))

