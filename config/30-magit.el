;;-*- coding: utf-8 -*-

(require 'bind-key)
(require 'magit)
(bind-key "C-x v d" 'magit-status)
(bind-key "C-x v L" 'magit-log-popup)
(bind-key "C-x v z" 'magit-stash)
(bind-key "C-x v B" 'magit-show-refs-popup)
(require 'mo-git-blame)
(bind-key "C-x v g" 'mo-git-blame-current)
