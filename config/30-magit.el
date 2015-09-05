;;-*- coding: utf-8 -*-

(el-get-bundle magit
  (global-set-key (kbd "C-x v d") 'magit-status)
  (global-set-key (kbd "C-x v L") 'magit-key-mode-popup-logging)
  (global-set-key (kbd "C-x v z") 'magit-stash)
  (global-set-key (kbd "C-x v B") 'magit-branch-manager)
  (with-eval-after-load-feature 'magit
    (define-key magit-mode-map (kbd "M-l") 'l-all)))
(el-get-bundle mo-git-blame
  (global-set-key (kbd "C-x v g") 'mo-git-blame-current))
