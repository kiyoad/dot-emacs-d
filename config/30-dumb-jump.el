;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(setq dumb-jump-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "M-g M-g") 'dumb-jump-go)
    (define-key map (kbd "M-g M-b") 'dumb-jump-back)
    (define-key map (kbd "M-g M-q") 'dumb-jump-quick-look)
    map))
(dumb-jump-mode +1)

;;; 30-dumb-jump.el ends here
