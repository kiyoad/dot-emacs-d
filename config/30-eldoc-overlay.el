;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'eldoc-overlay)
(add-hook 'prog-mode-hook 'eldoc-overlay-enable)

(require 'bind-key)
(bind-key "C-c t e" 'eldoc-overlay-toggle)

(provide '30-eldoc-overlay)
;;; 30-eldoc-overlay.el ends here
