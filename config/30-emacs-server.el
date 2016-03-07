;;-*- coding: utf-8 -*-

(setq server-socket-dir "~/.emacs.d")
(server-start)
(defun my-kill-emacs ()
  (interactive)
  (if (yes-or-no-p "Quit emacs? ")
      (save-buffers-kill-emacs)
    (server-edit)))
(require 'bind-key)
(bind-key "C-x C-c" 'my-kill-emacs)
