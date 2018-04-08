;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

;;; M-x projectile-discover-projects-in-directory

(setq projectile-keymap-prefix (kbd "C-c C-p"))
(setq projectile-completion-system 'helm)
(setq projectile-switch-project-action #'projectile-dired)
(setq projectile-mode-line
  '(:eval (format "[%s]"
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

(setq projectile-globally-ignored-modes
      '("erc-mode"
        "help-mode"
        "completion-list-mode"
        "Buffer-menu-mode"
        "gnus-.*-mode"
        "occur-mode"
        "package-menu-mode"
        "magit-*"
        "ipa-mode"
        "dired-mode"))

(setq projectile-globally-ignored-buffers
      '("COMMIT_EDITMSG"
        ".ipa"))

(projectile-mode +1)
(helm-projectile-on)

(provide '70-projectile)
;;; 70-projectile.el ends here
