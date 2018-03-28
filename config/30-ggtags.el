;;; Package --- summary
;;; -*- coding: utf-8 -*-
;;; Commentary:
;;; Code:

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))

(add-hook 'python-mode-hook
          '(lambda ()
             (ggtags-mode 1)
             (setq tab-width 4)))

(provide '30-ggtags)
;;; 30-ggtags.el ends here
