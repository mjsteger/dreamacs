(dreamacs-require-packages '(tern company-tern))
;; NB you'll also have to npm-install -g tern && npm install -g jshint to get this to work

(add-hook 'js-mode-hook
          (lambda ()
            (setq flycheck-checker 'javascript-jshint)
            (add-to-list 'company-backends 'company-tern)
            ))

(add-hook 'js-mode-hook 'company-mode)
(add-hook 'js-mode-hook 'tern-mode)

(setq js-indent-level 2)
(provide 'dreamacs-javascript)
