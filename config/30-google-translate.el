;;-*- coding: utf-8 -*-

;; http://rubikitch.com/2014/12/07/google-translate/

(el-get-bundle google-translate
  (defvar google-translate-english-chars "[:ascii:]“”"
    "これらの文字が含まれているときは英語とみなす")
  (require 'google-translate)
  (defun google-translate-enja-or-jaen (&optional string)
    "regionか、現在のセンテンスを言語自動判別でGoogle翻訳する。"
    (interactive)
    (setq string
          (cond ((stringp string) string)
                (current-prefix-arg
                 (read-string "Google Translate: "))
                ((use-region-p)
                 (replace-regexp-in-string
                  "[\n\t*/;#]" " "
                  (buffer-substring (region-beginning) (region-end))))
                (t
                 (save-excursion
                   (let (s)
                     (forward-char 1)
                     (backward-sentence)
                     (setq s (point))
                     (forward-sentence)
                     (buffer-substring s (point)))))))
    (let* ((asciip (string-match
                    (format "\\`[%s]+\\'" google-translate-english-chars)
                    string)))
      (run-at-time 0.1 nil 'deactivate-mark)
      (google-translate-translate
       (if asciip "en" "ja")
       (if asciip "ja" "en")
       string)))
  (require 'bind-key)
  (bind-key "C-c w t" 'google-translate-enja-or-jaen))
