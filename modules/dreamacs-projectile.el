(dreamacs-require-packages '(projectile projectile-rails helm-projectile))

(add-hook 'projectile-mode-hook 'projectile-rails-on)
(setq projectile-enable-caching t)

; Sane defaults for rails
(add-to-list 'projectile-globally-ignored-directories "log")
(add-to-list 'projectile-globally-ignored-directories "tmp")
(add-to-list 'projectile-globally-ignored-directories "vendor")
(add-to-list 'projectile-globally-ignored-directories "uploads")

(projectile-global-mode)

(provide 'dreamacs-projectile)
