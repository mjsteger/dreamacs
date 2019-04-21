(dreamacs-require-packages '(projectile projectile-rails))

(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq projectile-enable-caching t)

; Sane defaults for rails
(add-to-list 'projectile-globally-ignored-directories "log")
(add-to-list 'projectile-globally-ignored-directories "tmp")
(add-to-list 'projectile-globally-ignored-directories "vendor")
(add-to-list 'projectile-globally-ignored-directories "uploads")

(projectile-global-mode)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(provide 'dreamacs-projectile)
