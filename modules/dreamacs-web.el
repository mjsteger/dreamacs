(dreamacs-require-packages '(web-mode js3-mode))
(setq web-mode-hook
      '(lambda () (progn
                    (set-variable 'standard-indent 2)
                    ; (setq web-mode-code-indent-offset 2)
                    )))
