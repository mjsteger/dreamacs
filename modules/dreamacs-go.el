(dreamacs-require-packages '(company-go))

(add-hook 'before-save-hook 'gofmt-before-save)

(add-hook 'go-mode-hook '(lambda ()
                           (set (make-local-variable 'company-backends) '(company-go . no-cache))
                           (company-mode)
                           (setq godef-command (s-chomp (shell-command-to-string "which godef")))
          ))

(setq flycheck-go-golint-executable "/Users/steggy/gocode//bin/golint")

;; (with-eval-after-load 'go-mode (require 'go-autocomplete))



(provide 'dreamacs-go)
