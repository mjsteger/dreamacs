(dreamacs-require-packages '(company-go dap-mode company-lsp))

(require 'dap-go)
(dap-go-setup)

(add-hook 'before-save-hook 'lsp-format-buffer)

(add-hook 'go-mode-hook #'lsp)

;; ;; optional - provides fancier overlays
;; (use-package lsp-ui
;;   :commands lsp-ui-mode)

;; if you use company-mode for completion (otherwise, complete-at-point works out of the box):
(use-package company-lsp
  :commands company-lsp)



(push 'company-lsp company-backends)

(add-hook 'go-mode-hook '(lambda ()                          
                           (company-mode)
                           (add-hook 'before-save-hook 'gofmt-before-save)
;;                            (setq godef-command (s-chomp (shell-command-to-string "which godef")))
                           ))

(setq flycheck-go-golint-executable "/Users/steggy/gocode//bin/golint")

;; (with-eval-after-load 'go-mode (require 'go-autocomplete))



(provide 'dreamacs-go)
