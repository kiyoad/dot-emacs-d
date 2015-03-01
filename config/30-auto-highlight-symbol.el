;;-*- coding: utf-8 -*-

(setq auto-highlight-symbol-mode-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "M-(") 'ahs-backward)
        (define-key map (kbd "M-)") 'ahs-forward)
        map))

(el-get-bundle auto-highlight-symbol
  (with-eval-after-load-feature 'auto-highlight-symbol
    (add-to-list 'ahs-modes 'dockerfile-mode)
    (global-auto-highlight-symbol-mode t)))
