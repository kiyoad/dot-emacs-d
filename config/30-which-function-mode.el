;;-*- coding: utf-8 -*-

(which-function-mode 1)
(set-face-background 'header-line (my-flatui-color "clouds"))
(set-face-background 'which-func  (my-flatui-color "clouds"))

(setq mode-line-misc-info (delete (assoc 'which-func-mode
                                      mode-line-misc-info) mode-line-misc-info)
      which-func-header-line-format '(which-func-mode ("" which-func-format)))
(defadvice which-func-ff-hook (after header-line activate)
  (when which-func-mode
    (setq mode-line-misc-info (delete (assoc 'which-func-mode
                                          mode-line-misc-info) mode-line-misc-info)
                    header-line-format which-func-header-line-format)))
