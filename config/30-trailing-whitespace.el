;;-*- coding: utf-8 -*-

(set-face-background 'trailing-whitespace (my-flatui-color "carrot"))
(defun my-set-trailing-whitespace ()
  (setq show-trailing-whitespace t))

(add-hook 'prog-mode-hook 'my-set-trailing-whitespace)
(add-hook 'text-mode-hook 'my-set-trailing-whitespace)
