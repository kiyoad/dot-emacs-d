;;-*- coding: utf-8 -*-

;; http://qiita.com/ta2gch/items/c5c7115e0ac3f8273664

(setq skk-user-directory (concat user-emacs-directory "ddskk"))
;; https://raw.githubusercontent.com/skk-dev/ddskk/master/etc/SKK.tut
(setq skk-tut-file (concat user-emacs-directory "ddskk/SKK.tut"))
;; M-x skk-get
(setq skk-large-jisyo (concat user-emacs-directory "skk-get-jisyo/SKK-JISYO.L"))
(require 'skk)
(setq default-input-method "japanese-skk") ;; emacs上での日本語入力にskkをつかう
(add-hook 'skk-load-hook
          (lambda ()
            (require 'context-skk))) ;; 文脈に応じた自動モード切り替え
(require 'skk-hint)                  ;; 候補の絞り込み
(require 'skk-study)                 ;; 変換学習機能の追加
