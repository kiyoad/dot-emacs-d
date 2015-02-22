;;-*- coding: utf-8 -*-

;; (auto-install-from-emacswiki "text-translator-vars.el")
;; (auto-install-from-emacswiki "text-translator.el")
(require 'text-translator)

(setq text-translator-default-engine "freetranslation.com_enja")
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

(global-set-key (kbd "C-c w t") 'text-translator-translate-by-auto-selection)

(push '("*translated*" :stick t) popwin:special-display-config)
