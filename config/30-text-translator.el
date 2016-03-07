;;-*- coding: utf-8 -*-

(require 'bind-key)
(el-get-bundle emacswiki:text-translator-vars)
(el-get-bundle emacswiki:text-translator
  (bind-key "C-c w t" 'text-translator-translate-by-auto-selection)
  (require 'text-translator)
  (with-eval-after-load-feature 'text-translator
    ;; (setq text-translator-default-engine "freetranslation.com_enja")
    (setq text-translator-default-engine "fresheye.com_enja")
    (setq text-translator-auto-selection-func
          'text-translator-translate-by-auto-selection-enja)
    (defun text-translator-region-or-read-string (&optional prompt)
      "If mark is active, return the region, otherwise, thing at point."
      (cond
        (mark-active
          (replace-regexp-in-string "[\n\t*/;#]" " "
                                    (buffer-substring-no-properties (region-beginning) (region-end))))
        (t
         (thing-at-point 'symbol ))))
    (with-eval-after-load-feature 'popwin
      (push '("*translated*" :stick t) popwin:special-display-config))))
