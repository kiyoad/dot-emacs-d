;;-*- coding: utf-8 -*-

;; (auto-install-from-emacswiki "ipa.el")
(require 'ipa)
(setq ipa-file-function 'ipa-get-directory-file)

(global-set-key (kbd "C-c i i") 'ipa-insert)
(global-set-key (kbd "C-c i e") 'ipa-edit)
(global-set-key (kbd "C-c i n") 'ipa-next)
(global-set-key (kbd "C-c i p") 'ipa-previous)
(global-set-key (kbd "C-c i m") 'ipa-move)
(global-set-key (kbd "C-c i t") 'ipa-toggle)
(global-set-key (kbd "C-c i s") 'ipa-show)

(setq ipa-overriding-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-b") 'ipa-move-left)
    (define-key map (kbd "C-f") 'ipa-move-right)
    (define-key map (kbd "C-p") 'ipa-move-line-up)
    (define-key map (kbd "C-n") 'ipa-move-line-down)
    (define-key map (kbd "C-m") 'ipa-move-finish)
    (define-key map (kbd "C-c") 'ipa-move-cancel)
    (define-key map (kbd "h") 'ipa-move-help)
    map))
