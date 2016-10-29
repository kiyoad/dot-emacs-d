;;-*- coding: utf-8 -*-

(require 'scratch-pop)
(setq scratch-pop-backup-directory (concat user-emacs-directory "scratch_pop/"))
(scratch-pop-restore-scratches)
(add-hook 'kill-emacs-hook 'scratch-pop-backup-scratches)

(require 'bind-key)
(bind-key "C-c s" 'scratch-pop)
