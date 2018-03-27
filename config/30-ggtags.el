;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(defalias 'gtags-mode 'ggtags-mode)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(add-hook 'python-mode-hook
          '(lambda ()
             (gtags-mode 1)))

(provide '30-ggtags)
;;; 30-ggtags.el ends here
