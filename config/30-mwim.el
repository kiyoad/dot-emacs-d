;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'bind-key)
(bind-key "C-a" 'mwim-beginning)
(bind-key "C-e" 'mwim-end)

(provide '30-mwim)
;;; 30-mwim.el ends here
