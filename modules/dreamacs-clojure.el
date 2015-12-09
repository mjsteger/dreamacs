(dreamacs-require-packages '(cider paredit))

(add-hook 'cider-mode-hook #'eldoc-mode)
(setq nrepl-log-messages t)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-display-in-current-window t)

(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'paredit-mode)

(add-hook 'clojure-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (concat "lein test"))))

(provide 'dreamacs-clojure)
