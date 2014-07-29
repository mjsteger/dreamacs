(dreamacs-require-packages '(inf-ruby yari robe rbenv flymake-ruby rspec-mode ruby-end))

;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.thor\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Thorfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Podfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.podspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Puppetfile\\'" . ruby-mode))

(define-key ruby-mode-map (kbd "<tab>") 'ruby-indent-line)

(eval-after-load 'ruby-mode
  '(progn
     (defun dreamacs-ruby-mode-defaults ()
       (inf-ruby-minor-mode +1)
       ;; CamelCase aware editing operations
       (subword-mode +1)
	(flymake-ruby-load)
        (ruby-end-mode)
       (robe-mode)
       )

     (setq dreamacs-ruby-mode-hook 'dreamacs-ruby-mode-defaults)

     (add-hook 'ruby-mode-hook (lambda ()
                                 (run-hooks 'dreamacs-ruby-mode-hook)))))

(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t) (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(rspec-mode)

(defadvice inf-ruby-console-auto (before activate-rbenv-for-robe activate)
  (rbenv-use-corresponding))
(provide 'dreamacs-ruby)

; This allows you to switch between rspec-compilation-mode and ruby-compilation-mode
(inf-ruby-switch-setup)
