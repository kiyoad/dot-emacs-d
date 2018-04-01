;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(global-company-mode +1)
(setq company-auto-complete t)
(setq company-selection-wrap-around t)
(setq company-lighter-base "c_y")

(require 'bind-key)
(bind-key "C-M-i" 'company-complete)

(defun my-company-abort-space ()
  "My company-abort and insert space."
  (interactive)
  (company-abort)
  (insert " "))

(bind-key "SPC" 'my-company-abort-space company-active-map)

(provide '20-company)
;;; 20-company.el ends here
