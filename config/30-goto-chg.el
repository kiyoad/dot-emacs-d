;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'bind-key)
(bind-key "M-{" 'goto-last-change)
(bind-key "M-}" 'goto-last-change-reverse)

(provide '30-goto-chg)
;;; 30-goto-chg.el ends here
