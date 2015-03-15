;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/02/13/persp-mode/

(el-get-bundle persp-mode)
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

(defun my/persp-buffer-list ()
  (let* ((my/buffer-list (buffer-list))
         (my/buffer-count (length my/buffer-list))
         (index 0)
         (my/new-buffer-list nil))
    (while (< index my/buffer-count)
      (let* ((element (nth index my/buffer-list))
             (my/buffer-name (buffer-file-name element)))
        (unless (and (stringp my/buffer-name)
                   (string-match "\.ipa$" my/buffer-name))
          (setq my/new-buffer-list (cons element my/new-buffer-list)))
        (setq index (1+ index))))
    my/new-buffer-list))
(setq persp-buffer-list-function (symbol-function 'my/persp-buffer-list))
