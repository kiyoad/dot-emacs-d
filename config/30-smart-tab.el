;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

;; http://rubikitch.com/2015/04/01/smart-tab/

(require 'smart-tab)
(setq smart-tab-using-hippie-expand t)
(setq smart-tab-completion-functions-alist
      '(
        (emacs-lisp-mode . lisp-complete-symbol)
        (text-mode       . dabbrev-completion)
        ))

(global-smart-tab-mode 1)

(provide '30-smart-tab)
;;; 30-smart-tab.el ends here
