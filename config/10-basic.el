;;-*- coding: utf-8 -*-

(global-set-key (kbd "C-z") 'scroll-down)
(global-set-key (kbd "C-h") 'backward-delete-char-untabify)
(global-set-key (kbd "M-?") 'help-for-help)
(global-set-key (kbd "C-x C-b") 'ibuffer)

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

(global-hl-line-mode 1)

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

(setq inhibit-startup-screen t)
(setq initial-scratch-message "")

(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))

;;(global-linum-mode t)
;; (set-face-attribute 'linum nil
;;                     :foreground "#800"
;;                     :height 0.9)
;;(setq linum-format "%5d")

(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

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
