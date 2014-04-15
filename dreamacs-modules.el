(defun require-all-dreamacs (requirelist)
  (require-all (->> requirelist (-map 'symbol-name) (--map (concat "dreamacs-" it)) (-map 'intern))
               

(require-all-dreamacs '(
               autocomplete
               ido
               ruby
               gist
               dired
               ace
               ))
