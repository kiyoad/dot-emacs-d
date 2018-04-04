;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(setq hippie-expand-try-functions-list
  '(try-complete-file-name-partially
    try-complete-file-name
    try-expand-all-abbrevs
    try-expand-list
    try-expand-line
    try-expand-dabbrev
    try-expand-dabbrev-all-buffers
    try-expand-dabbrev-from-kill
    try-complete-lisp-symbol-partially
    try-complete-lisp-symbol
    ))

(require 'bind-key)
(bind-key "M-/" 'hippie-expand)

(defun my-hippie-expand ()
  "My 'hippie-expand'."
  (interactive "P")
  (hippie-expand nil))

(provide '30-hippie-expand)
;;; 30-hippie-expand.el ends here
