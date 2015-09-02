;;-*- coding: utf-8 -*-

(el-get-bundle helm-swoop)
(el-get-bundle helm-migemo)
(require 'helm-migemo)
;;; この修正が必要
(eval-after-load "helm-migemo"
  '(defun helm-compile-source--candidates-in-buffer (source)
     (helm-aif (assoc 'candidates-in-buffer source)
         (append source
                 `((candidates
                    . ,(or (cdr it)
                           (lambda ()
                             ;; Do not use `source' because other plugins
                             ;; (such as helm-migemo) may change it
                             (helm-candidates-in-buffer (helm-get-current-source)))))
                   (volatile) (match identity)))
       source)))

(with-eval-after-load "helm-swoop"
  (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
  (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  (defun helm-swoop-from-isearch ()
    "Invoke `helm-swoop' from isearch."
    (interactive)
    (let (($query (if isearch-regexp
                      (regexp-quote isearch-string)
                    isearch-string)))
      (isearch-exit)
      (helm-swoop :$query $query))))
