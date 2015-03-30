;;-*- coding: utf-8 -*-

(setq gtags-prefix-key "\C-cg")
(setq gtags-suggested-key-mapping t)
(setq gtags-read-only t)
(setq gtags-pop-delete t)
(setq gtags-select-buffer-single t)

(add-to-list 'load-path "/usr/local/share/gtags")
(require 'gtags)

(defvar my-gtags-command)
(setq-default my-gtags-command "gtags")
(make-variable-buffer-local 'my-gtags-command)

;; update GTAGS
(defun update-gtags (&optional prefix)
  (interactive "P")
  (let ((rootdir (gtags-get-rootpath))
        (args (if prefix "-v" "-iv"))
        (command my-gtags-command))
    (when rootdir
      (let* ((default-directory rootdir)
             (buffer (get-buffer-create "*update GTAGS*")))
        ;; (save-excursion
        ;;   (set-buffer buffer)
        ;;   (erase-buffer)
        ;;   (let ((result (process-file command nil buffer nil args)))
        ;;     (if (= 0 result)
        ;;         (message "GTAGS successfully updated.")
        ;;       (message "update GTAGS error with exit status %d" result))))))))
        (with-current-buffer buffer
          (erase-buffer)
          (let ((result (process-file command nil buffer nil args)))
            (if (= 0 result)
                (message "GTAGS successfully updated.")
              (message "update GTAGS error with exit status %d" result))))))))
(add-hook 'after-save-hook 'update-gtags)

(defun gtags-parse-file2 ()
  (interactive)
  (if (gtags-get-rootpath)
      (let*
          ((root (gtags-get-rootpath))
           (path (buffer-file-name))
           (gtags-path-style 'root)
           (gtags-rootdir root))
        (if (string-match (regexp-quote root) path)
            (gtags-goto-tag
             (replace-match "" t nil path)
             "f" nil)
          ;; delegate to gtags-parse-file
          (gtags-parse-file)))
    ;; delegate to gtags-parse-file
    (gtags-parse-file)))

;; get the path of gtags root directory.
(defun gtags-get-rootpath ()
  (let (path buffer n)
    (save-excursion
      (setq buffer (generate-new-buffer (generate-new-buffer-name "*rootdir*")))
      (set-buffer buffer)
      (setq n (process-file "global" nil t nil "-pr"))
      (if (= n 0)
          (setq path (file-name-as-directory (buffer-substring (point-min)(1- (point-max))))))
      (kill-buffer buffer))
    (if (and (fboundp 'tramp-tramp-file-p)
             (tramp-tramp-file-p default-directory))
        (with-parsed-tramp-file-name default-directory tr
          (when path
            (concat (substring default-directory 0 (* -1 (length tr-localname)))
                    path)))
      path)))


(add-hook 'c-mode-common-hook
          '(lambda ()
             (gtags-mode 1)))

(add-hook 'python-mode-hook
          '(lambda ()
             (setq my-gtags-command "pygtags")
             (gtags-mode 1)))
