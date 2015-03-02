;;-*- coding: utf-8 -*-

;; M-x jedi:install-server

(el-get-bundle jedi
  (add-hook 'python-mode-hook 'jedi:setup)
  (with-eval-after-load-feature 'jedi
    (setq jedi:complete-on-dot t)
    (with-eval-after-load-feature 'popwin
      (push '("*jedi:doc*" :noselect t) popwin:special-display-config))))
