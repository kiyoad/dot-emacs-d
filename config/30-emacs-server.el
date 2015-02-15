;;-*- coding: utf-8 -*-

(server-start)
(defun my-kill-emacs ()
  (interactive)
  (if (yes-or-no-p "Quit emacs? ")
      (save-buffers-kill-emacs)
    (server-edit)))
(global-set-key (kbd "C-x C-c") 'my-kill-emacs)
