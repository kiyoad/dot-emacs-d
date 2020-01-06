;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(add-hook 'python-mode-hook #'lsp-deferred)

(setq python-shell-interpreter "python3" )

(add-hook 'python-mode-hook
          '(lambda ()
             (gtags-mode 1)
             (setq tab-width 4)))

(provide '40-python.el)
;;; 40-python.el ends here
