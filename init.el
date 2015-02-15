;;-*- coding: utf-8 -*-

(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(setq auto-save-list-file-prefix
      (concat user-emacs-directory "auto-save-list/.saves-"))

(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(when (eq system-type 'darwin)
  (setq use-dialog-box nil)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))
(when (eq window-system 'w32)
  (set-file-name-coding-system 'cp932)
  (setq locale-coding-system 'cp932))

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("ELPA" . "http://tromey.com/elpa/"))
(package-initialize)

(defmacro my-require (package-name)
  `(progn
     (unless (package-installed-p ,package-name)
       (package-refresh-contents)
       (package-install ,package-name))
     (require ,package-name)))

(defmacro my-require-in-package (require-name package-name)
  `(progn
     (unless (package-installed-p ,package-name)
       (package-refresh-contents)
       (package-install ,package-name))
     (require ,require-name)))

(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
	      (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; M-x list-package auto-install
(setq auto-install-directory (concat user-emacs-directory "auto-install/"))
(my-require 'auto-install)
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(add-to-load-path "auto-install")

;; M-x package-install zenburn-theme
(load-theme 'zenburn t)

;; M-x package-install exec-path-from-shell
(my-require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; M-x package-install auto-async-byte-compile
(my-require 'auto-async-byte-compile)
(setq auto-async-byte-compile-exclude-files-regexp "/junk/\\|/config/\\|init.el")
(add-hook 'emacs-lisp-mode-hook 'enable-auto-async-byte-compile-mode)

;; M-x package-install init-loader
(my-require 'init-loader)
(init-loader-load (concat user-emacs-directory "config"))

