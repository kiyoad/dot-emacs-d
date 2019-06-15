;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

;;; C-c ! v runs the command flycheck-verify-setup

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide '30-flycheck-mode)
;;; 30-flycheck-mode.el ends here
