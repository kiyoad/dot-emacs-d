;;-*- coding: utf-8 -*-

;; M-x jedi:install-server

(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(with-eval-after-load 'jedi
  (setq jedi:complete-on-dot t)
  (with-eval-after-load 'popwin
    (push '("*jedi:doc*" :noselect t) popwin:special-display-config)))
