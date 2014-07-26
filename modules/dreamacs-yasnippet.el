(dreamacs-require-packages '(yasnippet))

(setq yas-snippet-dirs
      (list
       (concat dreamacs-elpa-base "/" (car (directory-files dreamacs-elpa-base nil "yasnippet.*")) "/snippets")
       (concat dreamacs-personal-dir "/snippets")
       )
      )

(global-set-key (kbd "M-i") 'yas-expand)
(yas-global-mode 1)

(provide 'dreamacs-yasnippet)
