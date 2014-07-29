(dreamacs-require-packages '(org-pomodoro))

(require 'ob)

(defvar home (expand-file-name "~/"))

(setq org-return-follows-link t)

(defvar common-notes-prefix "Dropbox/national/")

(setq org-log-done t)

(defun make-org-name (name)
  (concat home common-notes-prefix name))

(setq org-tickler-file (make-org-name "tickler.org")
      org-todo-file (make-org-name "todo.org")
      org-notes-file (make-org-name "notes.org")
      org-interesting-file (make-org-name "interesting.org")
      org-work-file (make-org-name "work.org")
      org-rubyflow-file (make-org-name "rubyflow.org"))

(setq org-agenda-files (list
                        org-tickler-file
                        org-todo-file
                        org-notes-file
                        org-work-file
                        ))

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)
(setq org-capture-templates (quote (("t" "Todo" entry (file "~/national/todo.org")
                                     "* TODO %?\n  %i\n " ))))
(provide 'dreamacs-org)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/national")

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")

;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; (require 'org-agenda)
;; (org-agenda-file-to-front "~/Dropbox/national")
