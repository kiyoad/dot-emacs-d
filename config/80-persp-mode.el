;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/02/13/persp-mode/

(require 'persp-mode)
(setq persp-set-ido-hooks t)
(persp-mode 1)

(add-to-list 'persp-filter-save-buffers-functions
             #'(lambda (b) (string-equal "ipa-mode" (buffer-local-value 'major-mode b))))
(add-to-list 'persp-filter-save-buffers-functions
             #'(lambda (b) (string-equal "dired-mode" (buffer-local-value 'major-mode b))))
(add-to-list 'persp-filter-save-buffers-functions
             #'(lambda (b) (let ((name (buffer-local-value 'buffer-file-name b)))
                             (and (stringp name) (string-match "/COMMIT_EDITMSG$" name)))))
