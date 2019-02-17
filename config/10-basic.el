;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'misc)

(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(when (eq system-type 'darwin)
  (setq use-dialog-box nil)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

(when (eq window-system 'x)
  ;;(setq-default line-spacing 3)
  (let* ((asciifont "Ricty Diminished Discord")
         (jpfont "Ricty Diminished Discord")
         (h 115)
         (fontspec (font-spec :family asciifont))
         (jp-fontspec (font-spec :family jpfont)))
      (set-face-attribute 'default nil :family asciifont :height h)
      (set-fontset-font nil 'japanese-jisx0213.2004-1 jp-fontspec)
      (set-fontset-font nil 'japanese-jisx0213-2 jp-fontspec)
      (set-fontset-font nil 'katakana-jisx0201 jp-fontspec)
      (set-fontset-font nil '(#x0080 . #x024F) fontspec)
      (set-fontset-font nil '(#x0370 . #x03FF) fontspec)))

(require 'bind-key)
(bind-key "C-z" 'scroll-down)
(bind-key "C-h" 'backward-delete-char-untabify)
(bind-key "C-h" 'isearch-delete-char isearch-mode-map)
(bind-key "M-?" 'help-for-help)
(bind-key "C-x C-b" 'ibuffer-list-buffers)

(defun my-scroll-down-other-window ()
  "Scroll next window downward by nearly full screen."
  (interactive)
  (scroll-other-window '-))
(bind-key "C-M-z" 'my-scroll-down-other-window)

(defun my-buffer-file-name ()
  "Show current buffer file name."
  (interactive)
  (message (buffer-file-name)))
(bind-key "C-x M-b" 'my-buffer-file-name)

(if (eq system-type 'darwin)
    (progn
      (defvar mac-command-modifier)
      (setq mac-command-modifier 'meta)
      (defvar mac-option-modifier)
      (setq mac-option-modifier  'super)
      (defvar ns-function-modifier)
      (setq ns-function-modifier 'hyper)
      ))

(require 'paren)
(setq show-paren-delay 0)
(show-paren-mode 1)
(setq show-paren-style 'mixed)

;; (size-indication-mode t)
(require 'time)
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(setq display-time-format "%m/%d(%a) %H:%M")
(display-time-mode 1)

(setq-default indent-tabs-mode nil)

(savehist-mode 1)
(line-number-mode -1)
(column-number-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq message-log-max 10000)
(setq history-length 1000)

;; (ffap-bindings)

(require 'dired-x)
(bind-key "r" 'wdired-change-to-wdired-mode dired-mode-map)
(setq dired-omit-files
      (rx (or (seq bol (? ".") "#")         ;; emacs autosave files
              (seq bol "." (not (any "."))) ;; dot-files
              (seq "~" eol)                 ;; backup-files
              (seq bol "CVS" eol)           ;; CVS dirs
              )))
(add-hook 'dired-mode-hook
           '(lambda () (dired-omit-mode 1))) ; C-x M-o
(setq dired-listing-switches "-alhF --group-directories-first")
(setq dired-dwim-target t)

(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

(delete-selection-mode 1)

(setq scroll-preserve-screen-position t); point keeps its screen position if the scroll command moved it vertically out of the window

(require 'iimage)
(setq iimage-mode-image-filename-regex
      (concat "[-~+./_0-9a-zA-Z]+\\."
              (regexp-opt (nconc (mapcar #'upcase
                                         image-file-name-extensions)
                                 image-file-name-extensions))))

(find-function-setup-keys)              ; C-x F OR C-x V OR C-x K

(put 'narrow-to-region 'disabled nil)

(setq auto-save-list-file-prefix
      (concat user-emacs-directory "auto-save-list/.saves-"))

(global-auto-revert-mode 1)
(setq auto-revert-mode-text "")

(provide '10-basic)
;;; 10-basic.el ends here
