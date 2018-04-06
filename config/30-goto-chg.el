;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'bind-key)
(bind-key "C-_" 'goto-last-change)
(bind-key "M-_" 'goto-last-change-reverse)

(provide '30-goto-chg)
;;; 30-goto-chg.el ends here
