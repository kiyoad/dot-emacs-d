;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/10/14/helm-google/

(require 'helm-google)
(setq helm-google-tld "co.jp")
;; Google側のサイトデザイン変更で動かなくなったらAPI検索に切替える
;; (setq helm-google-search-function 'helm-google-api-search)
;; ブラウザをEWWにすればEmacs内で完結する
(setq browse-url-browser-function 'eww-browse-url)
