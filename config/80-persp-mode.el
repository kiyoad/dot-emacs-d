;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(setq persp-set-ido-hooks t)
(persp-mode 1)

(add-to-list 'persp-filter-save-buffers-functions
             #'(lambda (b) (string-equal "ipa-mode" (symbol-name (buffer-local-value 'major-mode b)))))
(add-to-list 'persp-filter-save-buffers-functions
             #'(lambda (b) (string-equal "dired-mode" (symbol-name (buffer-local-value 'major-mode b)))))
(add-to-list 'persp-filter-save-buffers-functions
             #'(lambda (b)
                 (let ((result (string-match "^magit-" (symbol-name (buffer-local-value 'major-mode b)))))
                   (and (numberp result) (= result 0)))))

(provide '80-persp-mode)
;;; 80-persp-mode.el ends here
