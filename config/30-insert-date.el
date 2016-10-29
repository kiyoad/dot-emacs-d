;;-*- coding: utf-8 -*-

;; from ●るびきちEmacs 225●お便りを紹介します#4

(setq system-time-locale "C")
(defun insert-date (prefix)
  (interactive "P")
  (let ((format (cond
                 ((not prefix) "%Y年%m月%d日(%a) %H時%M分%S秒")
                 ((equal prefix '(4)) "%Y-%m-%d(%a) %H:%M:%S")
                 ((equal prefix '(16)) "%A, %d. %B %Y")
                 ((equal prefix '(64)) "%a, %d.%m.%Y")))
        (system-time-locale (if (not prefix)
                                "ja_JP.utf8"
                              system-time-locale)))
    (insert (format-time-string format))))
