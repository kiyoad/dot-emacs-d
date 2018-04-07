;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(setq my-origami-command-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "t") #'origami-recursively-toggle-node)
        (define-key map (kbd "o") #'origami-show-only-node)
        (define-key map (kbd "a") #'origami-toggle-all-nodes)
        (define-key map (kbd "u") #'origami-undo)
        (define-key map (kbd "r") #'origami-redo)
        map))
(fset 'my-origami-command-map my-origami-command-map)
(setq origami-mode-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "C-c o") 'my-origami-command-map)
        map))

(provide '30-origami)
;;; 30-origami.el ends here
