;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'bind-key)
(require 'ipa)
(bind-key "C-c i i" 'ipa-insert)
(bind-key "C-c i e" 'ipa-edit)
(bind-key "C-c i n" 'ipa-next)
(bind-key "C-c i p" 'ipa-previous)
(bind-key "C-c i m" 'ipa-move)
(bind-key "C-c i t" 'ipa-toggle)
(bind-key "C-c i s" 'ipa-show)
(with-eval-after-load 'ipa
  (defun my-ipa-get-global-file ()
    (concat user-emacs-directory ".ipa"))
  (setq ipa-file-function 'my-ipa-get-global-file)
  (setq ipa-annotation-face 'my-ipa-highlight)
  (bind-key "C-m" 'ipa-go-to-annotation ipa-mode-map)
  (setq ipa-overriding-map (make-sparse-keymap))
  (bind-key "C-b" 'ipa-move-left ipa-overriding-map)
  (bind-key "C-f" 'ipa-move-right ipa-overriding-map)
  (bind-key "C-p" 'ipa-move-line-up ipa-overriding-map)
  (bind-key "C-n" 'ipa-move-line-down ipa-overriding-map)
  (bind-key "C-m" 'ipa-move-finish ipa-overriding-map)
  (bind-key "C-c" 'ipa-move-cancel ipa-overriding-map)
  (bind-key "h"   'ipa-move-help ipa-overriding-map))

(provide '30-ipa)
;;; 30-ipa.el ends here
