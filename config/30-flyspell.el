;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

;; Mac:
;; sudo port install aspell
;; sudo port install aspell-dict-en

;; Ubuntu:
;; sudo apt-get install aspell

;; ~/.aspell.conf に "lang en_US" を書いておく。

(require 'ispell)
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
(setq ispell-extra-args
      '("--sug-mode=ultra" "--lang=en_US" "--run-together" "--run-together-limit=5" "--run-together-min=2"))

(require 'bind-key)
(bind-key "C-c t a" 'flyspell-mode)

;;; 30-flyspell.el ends here
