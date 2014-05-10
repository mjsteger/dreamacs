(dreamacs-require-packages '(projectile projectile-rails))

(add-hook 'projectile-mode-hook 'projectile-rails-on)

(projectile-global-mode)

(provide 'dreamacs-projectile)
