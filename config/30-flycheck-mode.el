;;-*- coding: utf-8 -*-

;; sudo pip install flake8

(el-get-bundle flycheck
  (add-hook 'python-mode-hook 'flycheck-mode)
  (with-eval-after-load-feature 'flycheck
    (custom-set-variables '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))
(el-get-bundle flycheck-pos-tip)
