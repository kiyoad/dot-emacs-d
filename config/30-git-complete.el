;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

;;; git clone https://github.com/zk-phi/git-complete.git ~/.emacs.d/site-lisp/git-complete

(add-to-list 'load-path (locate-user-emacs-file "site-lisp/git-complete"))
(require 'git-complete)
(require 'bind-key)
(bind-key* "C-c TAB" 'git-complete)

;;; 30-git-complete.el ends here
