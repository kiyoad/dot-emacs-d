;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

;;; M-x projectile-discover-projects-in-directory

(setq projectile-keymap-prefix (kbd "C-c C-p"))
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action #'projectile-dired)
(setq projectile-mode-line
  '(:eval (format " P_e[%s]"
                  (projectile-project-name))))

(add-hook 'persp-mode-projectile-bridge-mode-hook
          #'(lambda ()
              (if persp-mode-projectile-bridge-mode
                  (persp-mode-projectile-bridge-find-perspectives-for-all-buffers)
                (persp-mode-projectile-bridge-kill-perspectives))))
(add-hook 'after-init-hook
          #'(lambda ()
              (persp-mode-projectile-bridge-mode 1))
          t)

(add-hook 'ibuffer-hook
    (lambda ()
      (ibuffer-projectile-set-filter-groups)
      (unless (eq ibuffer-sorting-mode 'alphabetic)
        (ibuffer-do-sort-by-alphabetic))))

(projectile-mode +1)
(helm-projectile-on)

(add-hook `package-menu-mode-hook
          (lambda ()
            (projectile-mode -1)
            t))

(provide '80-projectile)
;;; 80-projectile.el ends here