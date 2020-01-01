;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(global-company-mode +1)
(setq company-auto-complete t)
(setq company-selection-wrap-around t)
(setq company-lighter-base "c_y")

(require 'bind-key)
(bind-key* "C-M-i" 'company-complete)

(defun my-company-abort-space ()
  "My company-abort and insert space."
  (interactive)
  (company-abort)
  (insert " "))

(bind-key "SPC" 'my-company-abort-space company-active-map)

(bind-key "C-n" 'company-select-next company-active-map)
(bind-key "C-p" 'company-select-previous company-active-map)
(bind-key "C-s" 'company-filter-candidates company-active-map)
(bind-key "C-i" 'company-complete-selection company-active-map)
(bind-key "<tab>" 'company-complete-selection company-active-map)

(bind-key "C-n" 'company-select-next company-search-map)
(bind-key "C-p" 'company-select-previous company-search-map)

(provide '20-company)
;;; 20-company.el ends here
