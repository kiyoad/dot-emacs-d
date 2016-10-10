;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/02/13/persp-mode/

(require 'persp-mode)
(persp-mode 1)
(defun persp-register-buffers-on-create ()
  (interactive)
  (dolist (bufname (condition-case _
                       (helm-comp-read
                        "Buffers: "
                        (mapcar 'buffer-name (buffer-list))
                        :must-match t
                        :marked-candidates t)
                     (quit nil)))
    (persp-add-buffer (get-buffer bufname))))
(add-hook 'persp-activated-hook 'persp-register-buffers-on-create)

(defun my/persp-buffer-list (&optional FRAME)
  (let* ((my/buffer-list (buffer-list FRAME))
         (my/buffer-count (length my/buffer-list))
         (index 0)
         (my/new-buffer-list nil))
    (while (< index my/buffer-count)
      (let* ((element (nth index my/buffer-list))
             (my/buffer-mode (buffer-local-value 'major-mode element)))
        (unless (or (string-equal "ipa-mode"   my/buffer-mode)
                    (string-equal "dired-mode" my/buffer-mode))
          (setq my/new-buffer-list (cons element my/new-buffer-list)))
        (setq index (1+ index))))
    my/new-buffer-list))
(setq persp-buffer-list-function (symbol-function 'my/persp-buffer-list))
