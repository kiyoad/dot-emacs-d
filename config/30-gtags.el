;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(add-to-list 'load-path "/usr/local/share/gtags")
(autoload 'gtags-mode "gtags" "" t)

(add-hook 'gtags-select-mode-hook
          '(lambda ()
             (setq hl-line-face 'underline)
             (hl-line-mode 1)))

(setq gtags-prefix-key "\C-cg")
(setq gtags-suggested-key-mapping t)
(setq gtags-read-only t)

(require 'bind-key)
(with-eval-after-load 'gtags
  (bind-key "C-]" nil gtags-mode-map)
  (bind-key "C-t" nil gtags-mode-map)
  (bind-key "M-." 'gtags-find-tag-from-here gtags-mode-map)
  (bind-key "M-," 'gtags-pop-stack gtags-mode-map)
  (bind-key "M-," 'gtags-pop-stack gtags-select-mode-map))

(add-to-list 'helm-completing-read-handlers-alist '(gtags-find-tag . nil))
(add-to-list 'helm-completing-read-handlers-alist '(gtags-find-rtag  . nil))
(add-to-list 'helm-completing-read-handlers-alist '(gtags-find-symbol . nil))

(provide '30-gtags)
;;; 30-gtags.el ends here
