(dreamacs-require-packages '(org-pomodoro org-gcal))

(defvar home (expand-file-name "~/"))

(setq org-return-follows-link t)

(defvar common-notes-prefix "Dropbox/national/gtd/")

(setq org-log-done t)

(defun make-org-name (name)
  (concat home common-notes-prefix name ".org"))

(defun add-org-name-to-agenda (name func)
  (add-to-list 'org-agenda-files (apply func name nil))
  )

(defun make-org-agenda-name (name)
  (concat home common-notes-prefix "agenda/" name ".org"))

(--each (list
         "calls"
         "office"
         "home"
         "anywhere"
         "errands"
         "at_computer"
         "inbox"
         "projects"
         "read-review"
         "appointments"
         "refile-beorg"
         "consulting"
         "google-cal"
         )
  (add-org-name-to-agenda it 'make-org-name))

(--each (list
         "jamie"
         "joonas-1:1"
         "standup"
         )
  (add-to-list 'org-agenda-files (make-org-agenda-name it)))


(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)

(setq org-capture-templates (quote (("c" "Calls" entry (file "~/national/gtd/calls.org")
                                     "** TODO %?\n  %i Filed on: %T\n" )
                                    ("o" "Office" entry (file "~/national/gtd/office.org")
                                     "** TODO %?\n  %i Filed on: %T\n")
                                    ("T" "Consulting" entry (file "~/national/gtd/consulting.org")
                                     "** TODO %?\n  %i Filed on: %T\n")
                                    ("h" "Home" entry (file "~/national/gtd/home.org")
                                     "** TODO %?\n  %i Filed on: %T\n")
                                    ("A" "Anywhere" entry (file "~/national/gtd/anywhere.org")
                                     "** TODO %?\n  %i Filed on: %T\n")
                                    ("j" "Jamie Agenda" entry (file "~/national/gtd/agenda/jamie.org")
                                     "** Scheduled %?\n  %i Filed on: %T\n")
                                    ("a" "Appointments" entry (file "~/national/gtd/appointments.org")
                                     "** Scheduled %?\n  %i Filed on: %T\n")
                                    ("J" "Joonas 1-1" entry (file "~/national/gtd/agenda/joonas-1:1.org")
                                     "** Scheduled %?\n  %i Filed on: %T\n")
                                    ("e" "Errands" entry (file "~/national/gtd/errands.org")
                                     "** TODO %?\n  %i Filed on: %T\n")
                                    ("C" "At computer" entry (file "~/national/gtd/at_computer.org")
                                     "** TODO %?\n  %i Filed on: %T\n")
                                    ("i" "Inbox" entry (file "~/national/gtd/inbox.org")
                                     "** %?\n %i Filed on: %T\n")
                                    ("s" "Someday/Maybe" entry (file "~/national/gtd/someday-maybe.org")
                                     "** %?\n %i Filed on: %T\n")
                                    ("S" "Standup" entry (file "~/national/gtd/agenda/standup.org")
                                     "** Scheduled %?\n  %i Filed on: %T\n")
                                    )
                                    ))

(setq org-agenda-skip-scheduled-if-done t)

(provide 'dreamacs-org)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/national")

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/national/mobile-in.org")

;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; (require 'org-agenda)


(require 'appt)
; Automagically convert all my scheduled things into appointments
(add-hook 'org-finalize-agenda-hook (lambda () (org-agenda-to-appt)))

;; setq 'org-agenda-custom-commands
;;   (quote (("d" todo "DELEGATED" nil)
;;           ("c" todo "DONE|DEFERRED|CANCELLED" nil)
;;           ("w" todo "WAITING" nil)
;;           ("W" agenda "" ((org-agenda-ndays 21)))
;;           ("A" agenda ""
;;            ((org-agenda-skip-function
;;              (lambda nil
;;                (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
;;             (org-agenda-ndays 1)
;;             (org-agenda-overriding-header "Today's Priority #A tasks: ")))
;;           ("u" alltodo ""
;;            ((org-agenda-skip-function
;;              (lambda nil
;;                (org-agenda-skip-entry-if (quote scheduled) (quote deadline)
;;                                          (quote regexp) "\n]+>")))
;;             (org-agenda-overriding-header "Unscheduled TODO entries: "))))))

(setq org-todo-keywords
      '((sequence "TODO(t!/!)" "WAITING(w@/@)" "DEFERRED(l!/!)" "Scheduled(s!/!)" "|" "DONE(d!)" "DELEGATED(d@)" "CANCELED(c@)")))

;; (eval-after-load "org"
;;   '(progn
;;      (define-prefix-command 'org-todo-state-map)

;;      (define-key org-mode-map "\C-cx" 'org-todo-state-map)

;;      (define-key org-todo-state-map "x"
;;        #'(lambda nil (interactive) (org-todo "CANCELLED")))
;;      (define-key org-todo-state-map "d"
;;        #'(lambda nil (interactive) (org-todo "DONE")))
;;      (define-key org-todo-state-map "f"
;;        #'(lambda nil (interactive) (org-todo "DEFERRED")))
;;      (define-key org-todo-state-map "l"
;;        #'(lambda nil (interactive) (org-todo "DELEGATED")))
;;      (define-key org-todo-state-map "s"
;;        #'(lambda nil (interactive) (org-todo "STARTED")))
;;      (define-key org-todo-state-map "w"
;;        #'(lambda nil (interactive) (org-todo "WAITING")))

;;      (define-key org-agenda-mode-map "\C-n" 'next-line)
;;      (define-key org-agenda-keymap "\C-n" 'next-line)
;;      (define-key org-agenda-mode-map "\C-p" 'previous-line)
;;      (define-key org-agenda-keymap "\C-p" 'previous-line)))


(setq org-icalendar-use-deadline '(todo-due event-if-todo))
(setq org-icalendar-store-UID t)
(setq org-icalendar-include-todo t)
(setq org-icalendar-use-scheduled '(event-if-todo event-if-not-todo))
(setq org-deadline-warning-days 0)
(setq org-icalendar-timezone "Pacific Time (US & Canada)")

; Allow me to refile things into other files
(setq org-refile-targets
      `(
        (
         ,org-agenda-files
         :regexp . "refile")
        ))
(setq org-refile-use-outline-path 'file)
(setq org-completion-use-ido t)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes t)

(setq org-columns-default-format "%25ITEM %TODO %3PRIORITY %TAGS %5Effort{+} %CLOCKSUM")


;; Shamelessly stolen from http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs
;; To allow global-est keybindings
(add-hook 'after-load-functions 'my-keys-have-priority)

(defun my-keys-have-priority (_file)
  "Try to ensure that my keybindings retain priority over other minor modes.

Called via the `after-load-functions' special hook."
  (unless (eq (caar minor-mode-map-alist) 'my-keys-minor-mode)
    (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
      (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
      (add-to-list 'minor-mode-map-alist mykeys))))

(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-c r") 'org-capture)
    map)
  "my-keys-minor-mode keymap.")

; Set up diary file to in my home dir, and use in agenda
(setq diary-file "~/diary")
(setq org-agenda-include-diary t)

(setq org-use-fast-tag-selection nil)
(setq org-complete-tags-always-offer-all-agenda-tags t)

(setq org-gcal-client-id "970039304533-3vr3cceh1n690ba0kgu4nva3qth22d28.apps.googleusercontent.com"
      org-gcal-client-secret "gi56Og1aG1vS1bq3J9mZ7JnC"
      org-gcal-file-alist '(("mjsteger1@gmail.com" .  "~/national/gtd/google-cal.org")
                             ;; ("-mail@gmail.com" .  "~/task.org")
                             ))

(add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
(add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))

;; dreamacs-org.el ends here
