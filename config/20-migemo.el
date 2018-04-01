;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(setq migemo-isearch-enable-p nil)      ; default MIGEMO off
(migemo-init)

(helm-migemo-mode -1)                   ; default off

(provide '20-migemo)
;;; 20-migemo.el ends here
