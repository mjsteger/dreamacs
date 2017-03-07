(dreamacs-require-packages '(company-go))

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook '(lambda ()
                           (set (make-local-variable 'company-backends) '(company-go))
                           (company-mode)
          ))

(with-eval-after-load 'go-mode (require 'go-autocomplete))

(provide 'dreamacs-go)
