(require 'thingatpt)
(require 'dash)
(require 'epl)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

(defun dreamacs-update ()
  "Update Dreamacs to its latest version."
  (interactive)
  (when (y-or-n-p "Do you want to update Dreamacs? ")
    (message "Updating installed packages...")
    (epl-upgrade)
    (message "Updating Dreamacs...")
    (cd dreamacs-base-dir)
    (shell-command "git pull")
    (dreamacs-recompile-init)
    (message "Update finished. Restart Emacs to complete the process.")))

(defun dreamacs-recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dreamacs-dir 0))

(defun dreamacs-update-packages (&optional arg)
  "Update Dreamacs's packages.
This includes package installed via `dreamacs-require-package'.

With a prefix ARG updates all installed packages."
  (interactive "P")
  (when (y-or-n-p "Do you want to update Dreamacs's packages? ")
    (if arg
        (epl-upgrade)
      (epl-upgrade (-filter (lambda (p) (memq (epl-package-name p) dreamacs-packages))
                            (epl-installed-packages))))
    (message "Update finished. Restart Emacs to complete the process.")))

(provide 'dreamacs-core)
