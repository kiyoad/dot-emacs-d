;;-*- coding: utf-8 -*-

;; sudo pip install flake8

(require 'pos-tip)
(require 'flycheck-pos-tip)
(require 'flycheck)
(add-hook 'python-mode-hook 'flycheck-mode)
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode)
  (custom-set-variables '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
