;;-*- coding: utf-8 -*-

;; sudo pip install flake8

(require 'pos-tip)
(require 'flycheck-pos-tip)
(require 'flycheck)

(defun my-use-python3-instead-of-python2 (x)
  (cond ((string= x "python") "python3")
        (t x)))

(with-eval-after-load 'flycheck
  (advice-add 'flycheck-checker-default-executable :filter-return #'my-use-python3-instead-of-python2)
  (flycheck-pos-tip-mode)
  (custom-set-variables '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

(add-hook 'after-init-hook #'global-flycheck-mode)
