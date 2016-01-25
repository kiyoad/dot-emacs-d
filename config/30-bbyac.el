;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/03/12/bbyac/

(el-get-bundle browse-kill-ring)
(el-get-bundle ido-vertical-mode)
(el-get-bundle baohaojun/bbyac)
(require 'browse-kill-ring)
(require 'ido-vertical-mode)
(require 'bbyac)
(setq ido-max-window-height 0.75)
(setq ido-enable-flex-matching t)
(ido-vertical-mode 1)

(setq bbyac-max-chars 99999)
(defun bbyac--display-matches--use-ido (orig strlist)
  (cond ((null (cdr strlist))
         (car strlist))
        ((cl-notany #'bbyac--string-multiline-p strlist)
         (ido-completing-read "Bbyac: " strlist nil t))
        (t (apply orig strlist))))
(advice-add 'bbyac--display-matches :around 'bbyac--display-matches--use-ido)
(bbyac-global-mode 1)
(setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
