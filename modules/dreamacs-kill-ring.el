(dreamacs-require-packages '(popup-kill-ring))

(setq popup-kill-ring-interactive-insert t)

(global-set-key (kbd "M-y") 'popup-kill-ring)

(provide 'dreamacs-kill-ring)
