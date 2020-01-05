;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(defun my-set-trailing-whitespace ()
  (setq show-trailing-whitespace t))

(add-hook 'prog-mode-hook 'my-set-trailing-whitespace)
(add-hook 'text-mode-hook 'my-set-trailing-whitespace)

(provide '30-trailing-whitespace)
;;; 30-trailing-whitespace.el ends here
