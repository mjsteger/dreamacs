(dreamacs-require-packages '(company-go dap-mode company-lsp))

(require 'dap-go)
(dap-go-setup)

(add-hook 'before-save-hook 'lsp-format-buffer)

;; if you use company-mode for completion (otherwise, complete-at-point works out of the box):
(use-package company-lsp
  :commands company-lsp)


(push 'company-lsp company-backends)

(add-hook 'go-mode-hook '(lambda ()                          
                           (company-mode)
                           (add-hook 'before-save-hook 'gofmt-before-save)
                           (lsp)
                           (lsp-mode)
                           (lsp-ui-mode -1)
                           (local-set-key (kbd "M-.") (lambda() (interactive) (lsp-find-definition)))


                           ))

(define-key go-mode-map (kbd "M-.") 'lsp-find-defintion)

(setq flycheck-go-golint-executable "/Users/steggy/gocode//bin/golint")

;; (with-eval-after-load 'go-mode (require 'go-autocomplete))



(provide 'dreamacs-go)
