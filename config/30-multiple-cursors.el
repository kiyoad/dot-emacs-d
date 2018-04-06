;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(require 'bind-key)
(bind-key "M-s M-s" 'mc/edit-lines)
(bind-key "M-s p" 'mc/mark-previous-like-this)
(bind-key "M-s n" 'mc/mark-next-like-this)
(bind-key "M-s a" 'mc/mark-all-like-this)
(bind-key "M-s d" 'mc/mark-all-dwim)

(provide '30-multiple-cursors)
;;; 30-multiple-cursors.el ends here
