;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

;; M-x jedi:install-server

(setq jedi:complete-on-dot t)
;; (setq jedi:use-shortcuts t)

(defun my-python-jedi-mode-hook ()
  "My python jedi mode hook."
  (jedi:setup)
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my-python-jedi-mode-hook)

(provide '40-python-jedi)
;;; 40-python-jedi.el ends here
