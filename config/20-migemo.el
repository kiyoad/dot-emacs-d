;;-*- coding: utf-8 -*-

(el-get-bundle migemo)
(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(setq migemo-isearch-enable-p nil)      ; default MIGEMO off
(migemo-init)

;; http://rubikitch.com/2014/12/19/helm-migemo/

(el-get-bundle helm-migemo)
;;; この修正が必要
(with-eval-after-load "helm-migemo"
  (defun helm-compile-source--candidates-in-buffer (source)
    (helm-aif (assoc 'candidates-in-buffer source)
        (append source `((candidates . ,(or (cdr it)
                                            (lambda ()
                                              ;; Do not use `source' because other plugins
                                              ;; (such as helm-migemo) may change it (helm-candidates-in-buffer
                                              (helm-get-current-source)))))
                (volatile) (match identity)))
    source))
;; [2015-09-06 Sun]helm-match-plugin -> helm-multi-match変更の煽りを受けて
(defalias 'helm-mp-3-get-patterns 'helm-mm-3-get-patterns)
(defalias 'helm-mp-3-search-base 'helm-mm-3-search-base)
