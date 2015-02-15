;;-*- coding: utf-8 -*-

;; M-x package-install flycheck-mode
;; sudo pip install flake8
;; M-x package-install flycheck-pos-tip

(my-require 'flycheck)

(my-require 'flycheck-pos-tip)
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
