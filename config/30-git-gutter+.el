;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'git-gutter+)
(require 'git-gutter-fringe+)
(global-git-gutter+-mode)

(require 'bind-key)
(bind-key "C-c t g" 'git-gutter+-toggle-fringe git-gutter+-mode-map)
(bind-key "C-x v SPC" 'git-gutter+-show-hunk-inline-at-point git-gutter+-mode-map)

(provide '30-git-gutter+)
;;; 30-git-gutter+.el ends here
