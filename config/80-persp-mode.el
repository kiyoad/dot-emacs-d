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

(add-to-list 'persp-filter-save-buffers-functions
             #'(lambda (b) (string-equal "ipa-mode" (buffer-local-value 'major-mode b))))
(add-to-list 'persp-filter-save-buffers-functions
             #'(lambda (b) (string-equal "dired-mode" (buffer-local-value 'major-mode b))))
(add-to-list 'persp-filter-save-buffers-functions
             #'(lambda (b) (let ((name (buffer-local-value 'buffer-file-name b)))
                             (and (stringp name) (string-match "/COMMIT_EDITMSG$" name)))))
