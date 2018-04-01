;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(add-to-list 'auto-mode-alist '("\\.adoc\\'" . adoc-mode))
(add-to-list 'auto-mode-alist '("\\.txt\\'". adoc-mode))

(add-hook 'adoc-mode-hook 'pangu-spacing-mode)

(provide '40-adoc-mode)
;;; 40-adoc-mode.el ends here
