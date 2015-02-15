;;-*- coding: utf-8 -*-

;; M-x package-install jedi
;; M-x jedi:install-server

(my-require 'jedi)
(setq jedi:complete-on-dot t)
(add-hook 'python-mode-hook 'jedi:setup)

(push '("*jedi:doc*" :noselect t) popwin:special-display-config)
