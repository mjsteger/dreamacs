(dreamacs-require-packages '(company))

(global-company-mode t)
(push 'company-robe company-backends)

(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(setq company-idle-delay t)

; Prevent me from getting autocompletes unless I'm actually typing
(setq company-begin-commands '(self-insert-command))

(global-set-key "\t" 'company-complete)


(provide 'dreamacs-autocomplete)
