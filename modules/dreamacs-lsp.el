(dreamacs-require-packages '(use-package lsp-mode dap-mode lsp-ui))

(use-package lsp-mode
  :hook (XXX-mode . lsp)
  :commands lsp)
(setq lsp-ui-doc-enable nil) 
(setq lsp-ui-sideline-show-symbol nil)
(setq lsp-ui-sideline-show-hover nil)
(setq lsp-ui-sideline-show-code-actions nil)

(define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
(define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
;; optionally if you want to use debugger
(setq lsp-eldoc-render-all nil)

(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language
