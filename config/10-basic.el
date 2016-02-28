;;-*- coding: utf-8 -*-

(require 'misc)

(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(when (eq system-type 'darwin)
  (setq use-dialog-box nil)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))

(global-set-key (kbd "C-z") 'scroll-down)
(global-set-key (kbd "C-h") 'backward-delete-char-untabify)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)
(global-set-key (kbd "M-?") 'help-for-help)
(global-set-key (kbd "C-x C-b") 'ibuffer-list-buffers)
(global-set-key (kbd "M-f") 'forward-to-word)

(defun my-toggle-buffer ()
  "Switch to last buffer."
  (interactive)
  (switch-to-buffer nil))

(global-set-key (kbd "C-t") 'my-toggle-buffer)
(with-eval-after-load 'ibuffer
  (define-key ibuffer-mode-map (kbd "C-t") nil))
(with-eval-after-load 'dired
  (define-key dired-mode-map "\C-td" nil)
  (define-key dired-mode-map "\C-tt" nil)
  (define-key dired-mode-map "\C-tr" nil)
  (define-key dired-mode-map "\C-tj" nil)
  (define-key dired-mode-map "\C-ti" nil)
  (define-key dired-mode-map "\C-tx" nil)
  (define-key dired-mode-map "\C-ta" nil)
  (define-key dired-mode-map "\C-t." nil)
  (define-key dired-mode-map "\C-tc" nil)
  (define-key dired-mode-map "\C-tf" nil)
  (define-key dired-mode-map "\C-t\C-t" nil)
  (define-key dired-mode-map "\C-te" nil)
  (define-key dired-mode-map "\C-t" 'my-toggle-buffer))

(defun my-scroll-down-other-window ()
  "Scroll next window downward by nearly full screen."
  (interactive)
  (scroll-other-window '-))
(global-set-key (kbd "C-M-z") 'my-scroll-down-other-window)

(defun my-buffer-file-name ()
  "Show current buffer file name."
  (interactive)
  (message (buffer-file-name)))
(global-set-key (kbd "C-x M-b") 'my-buffer-file-name)

(if (eq system-type 'darwin)
    (progn
      (defvar mac-command-modifier)
      (setq mac-command-modifier 'meta)
      (defvar mac-option-modifier)
      (setq mac-option-modifier  'super)
      (defvar ns-function-modifier)
      (setq ns-function-modifier 'hyper)
      ))

;;(global-hl-line-mode 1)
;;(custom-set-faces '(hl-line ((t (:background "#484848"))))) ; for zenburn-theme

(require 'paren)
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'expression)
(set-face-background 'show-paren-match-face nil)
(set-face-underline 'show-paren-match-face "red")

(size-indication-mode t)
(require 'time)
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(setq display-time-format "%m/%d(%a) %H:%M")
(display-time-mode t)

(setq-default indent-tabs-mode nil)

(savehist-mode 1)
(line-number-mode 1)
(column-number-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq message-log-max 10000)
(setq history-length 1000)

(ffap-bindings)

(require 'dired-x)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)
(setq dired-omit-files
      (rx (or (seq bol (? ".") "#")         ;; emacs autosave files
              (seq bol "." (not (any "."))) ;; dot-files
              (seq "~" eol)                 ;; backup-files
              (seq bol "CVS" eol)           ;; CVS dirs
              )))
(add-hook 'dired-mode-hook
           '(lambda () (dired-omit-mode 1))) ; C-x M-o
(setq dired-listing-switches "-alh")
(setq dired-dwim-target t)

(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

(setq-default line-spacing 3)

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
