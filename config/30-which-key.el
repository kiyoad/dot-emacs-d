;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/09/14/which-key/

(el-get-bundle which-key
  ;;; 3つの表示方法どれか1つ選ぶ
  (which-key-setup-side-window-bottom)    ;ミニバッファ
  ;; (which-key-setup-side-window-right)     ;右端
  ;; (which-key-setup-side-window-right-bottom) ;両方使う

  (which-key-mode 1))
