;;-*- coding: utf-8 -*-

;; M-x package-install auto-highlight-symbol

(setq auto-highlight-symbol-mode-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "M-(") 'ahs-backward)
        (define-key map (kbd "M-)") 'ahs-forward)
        map))

(my-require 'auto-highlight-symbol)
(add-to-list 'ahs-modes 'dockerfile-mode)
(global-auto-highlight-symbol-mode t)
