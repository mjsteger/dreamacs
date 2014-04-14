(dreamacs-require-packages '(company))

(global-company-mode t)
(push 'company-robe company-backends)

(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(setq company-idle-delay t)

(provide 'dreamacs-autocomplete)
