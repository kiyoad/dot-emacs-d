;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

;;; C-c ! v runs the command flycheck-verify-setup

(require 'pos-tip)
(require 'flycheck-pos-tip)
(require 'flycheck)

(defun my-use-python3-instead-of-python2 (x)
  "Replace input (as X)."
  (cond ((string= x "python") "python3")
        (t x)))

(with-eval-after-load 'flycheck
  (advice-add 'flycheck-checker-default-executable :filter-return #'my-use-python3-instead-of-python2)
  (flycheck-pos-tip-mode))

(add-hook 'after-init-hook #'global-flycheck-mode)

(provide '30-flycheck-mode)
;;; 30-flycheck-mode.el ends here
