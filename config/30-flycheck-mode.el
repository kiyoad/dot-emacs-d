;;-*- coding: utf-8 -*-

;; sudo pip install flake8

(el-get-bundle flycheck
  (add-hook 'python-mode-hook 'flycheck-mode)
  (with-eval-after-load-feature 'flycheck
    (custom-set-variables '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))
(el-get-bundle syohex/pos-tip)
(el-get-bundle flycheck-pos-tip
  (defun my-flycheck-pos-tip-show (messages)
    (pos-tip-show (mapconcat #'identity messages "\n")
                  '("white" . "gray30")))
  (with-eval-after-load-feature 'flycheck-pos-tip
    (setq flycheck-pos-tip-show-function #'my-flycheck-pos-tip-show)))
