(dreamacs-require-packages '(dired-subtree))

(define-key dired-mode-map (kbd "C-, i") 'dired-subtree-insert)
(define-key dired-mode-map (kbd "C-, d") 'dired-subtree-remove)
(define-key dired-mode-map (kbd "C-, p") 'dired-subtree-up)
(define-key dired-mode-map (kbd "C-, n") 'dired-subtree-down)

(provide 'dreamacs-dired)

