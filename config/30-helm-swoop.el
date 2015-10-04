;;-*- coding: utf-8 -*-

(el-get-bundle helm-swoop)
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
