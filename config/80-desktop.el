;;-*- coding: utf-8 -*-

(require 'desktop)
(setq desktop-dirname user-emacs-directory)

(setq desktop-buffers-not-to-save
      (concat "\\("
              "^nn\\.a[0-9]+\\|\\.log\\|(ftp)\\|^tags\\|^TAGS"
              "\\|\\.emacs.*\\|\\.diary\\|\\.newsrc-dribble\\|\\.bbdb"
              "\\)$"))
(setq desktop-files-not-to-save
      (concat "\\("
              "^/[^/:]*:"
              "\\|\\.ipa$"
              "\\)"))

(add-to-list 'desktop-modes-not-to-save 'dired-mode)
(add-to-list 'desktop-modes-not-to-save 'Info-mode)
(add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
(add-to-list 'desktop-modes-not-to-save 'fundamental-mode)

(add-to-list 'desktop-globals-to-save 'extended-command-history)

(setq desktop-load-locked-desktop t)    ; t -- load anyway.
(setq desktop-save t)                   ; t -- always save.
(desktop-save-mode 1)
