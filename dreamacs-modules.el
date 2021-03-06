(defun require-all-dreamacs (requirelist)
  (require-all (->> requirelist (-map 'symbol-name) (--map (concat "dreamacs-" it)) (-map 'intern))))

(-map 'dreamacs-require-packages (append dreamacs-personal-configurationless-modules '()))

(dreamacs-require-packages '(use-package))

(require-all-dreamacs (append dreamacs-personal-modules '(
                        ace
                        autocomplete
                        coffee
                        columns
                        dash
                        dired
                        gist
                        haml
                        ido
                        kill-ring
                        projectile
                        ruby
                        yasnippet
                        vagrant
                        lsp
                        go
                        javascript
                        html
                        )))
