;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

;; https://skk-dev.github.io/ddskk/skk.html

(setq skk-user-directory (concat user-emacs-directory "ddskk"))
;; https://raw.githubusercontent.com/skk-dev/ddskk/master/etc/SKK.tut
(setq skk-tut-file (concat user-emacs-directory "ddskk/SKK.tut"))
;; M-x skk-get
(setq skk-large-jisyo (concat user-emacs-directory "skk-get-jisyo/SKK-JISYO.L"))

(add-hook 'skk-load-hook
          (lambda ()
            (require 'context-skk)))

(setq default-input-method "japanese-skk") ;; emacs上での日本語入力にskkをつかう

(require 'bind-key)
(bind-key "M-\\" 'toggle-input-method)

(provide '20-skk)
;;; 20-skk.el ends here
