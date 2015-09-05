;;-*- coding: utf-8 -*-

(el-get-bundle magit
  (global-set-key (kbd "C-x v d") 'magit-status)
  (global-set-key (kbd "C-x v L") 'magit-log-popup)
  (global-set-key (kbd "C-x v z") 'magit-stash)
  (global-set-key (kbd "C-x v B") 'magit-show-refs-popup))
(el-get-bundle mo-git-blame
  (global-set-key (kbd "C-x v g") 'mo-git-blame-current))
