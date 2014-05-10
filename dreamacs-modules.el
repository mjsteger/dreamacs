(defun require-all-dreamacs (requirelist)
  (require-all (->> requirelist (-map 'symbol-name) (--map (concat "dreamacs-" it)) (-map 'intern))))
               



(require-all-dreamacs '(
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
               ))
