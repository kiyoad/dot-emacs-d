;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/09/13/easy-kill/

;; キー  コピー対象
;; M-w   行
;; M-w w 単語
;; M-w s S式
;; M-w l リスト
;; M-w f ファイル名
;; M-w d defun
;; M-w D 関数名
;; M-w e 行(e連打で下に範囲が増える)
;; M-w b buffer-file-name

;; コピーした後にC-wを押せば、その部分を削除(キル)します。

(require 'bind-key)
(el-get-bundle easy-kill
  (bind-key "M-w" 'easy-kill))
