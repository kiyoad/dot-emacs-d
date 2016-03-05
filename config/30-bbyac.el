;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/03/12/bbyac/

(el-get-bundle browse-kill-ring)
(el-get-bundle baohaojun/bbyac)
(require 'browse-kill-ring)
(require 'bbyac)

(setq bbyac-max-chars 99999)
(defun bbyac--display-matches--use-ido (orig strlist)
  (cond ((null (cdr strlist))
         (car strlist))
        ((cl-notany #'bbyac--string-multiline-p strlist)
         (ido-completing-read "Bbyac: " strlist nil t))
        (t (apply orig strlist))))
(advice-add 'bbyac--display-matches :around 'bbyac--display-matches--use-ido)
(bbyac-global-mode 1)
