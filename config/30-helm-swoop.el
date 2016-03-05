;;-*- coding: utf-8 -*-

(el-get-bundle helm-swoop)
(with-eval-after-load "helm-swoop"
  (bind-key "C-s" 'helm-next-line     helm-swoop-map)
  (bind-key "C-r" 'helm-previous-line helm-swoop-map)
  (defun helm-swoop-from-isearch ()
    "Invoke `helm-swoop' from isearch."
    (interactive)
    (let (($query (if isearch-regexp
                      (regexp-quote isearch-string)
                    isearch-string)))
      (isearch-exit)
      (helm-swoop :$query $query))))
