;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2015/04/01/smart-tab/

(el-get-bundle smart-tab
  ;;; nilならばdabbrev-expand, tならばhippie-expandで補完する
  (setq smart-tab-using-hippie-expand t)
  ;;; モードごとの補完コマンドの設定
  (setq smart-tab-completion-functions-alist
        '(
          (emacs-lisp-mode . lisp-complete-symbol)
          (text-mode       . dabbrev-completion)
          )))

(add-hook 'prog-mode-hook 'smart-tab-mode)
(add-hook 'text-mode-hook 'smart-tab-mode)
