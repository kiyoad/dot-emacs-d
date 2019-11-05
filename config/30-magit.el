;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'bind-key)
(require 'magit)
(bind-key "C-x v d" 'magit-status)
(bind-key "C-x v L" 'magit-log)
(bind-key "C-x v z" 'magit-stash)
(bind-key "C-x v B" 'magit-show-refs)
(require 'mo-git-blame)
(bind-key "C-x v g" 'mo-git-blame-current)

;;; 30-magit.el ends here
