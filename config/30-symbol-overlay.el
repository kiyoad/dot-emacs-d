;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

;;; C-x V symbol-overlay-map

(require 'bind-key)
(bind-key "M-i" 'symbol-overlay-put)
(bind-key "M-p" 'symbol-overlay-switch-backward)
(bind-key "M-n" 'symbol-overlay-switch-forward)

(add-hook 'prog-mode-hook 'symbol-overlay-mode)

(provide '30-symbol-overlay)
;;; 30-symbol-overlay.el ends here
