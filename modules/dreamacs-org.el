(dreamacs-require-packages '(org-pomodoro))

(require 'ob)

(defvar home (expand-file-name "~/"))

(setq org-return-follows-link t)

(defvar common-notes-prefix "Dropbox/national/")

(setq org-log-done t)

(defun make-org-name (name)
  (concat home common-notes-prefix name ".org"))




(--each (list
         "todo"
         "notes"
         "interesting"
         "work"
         "home"
         "google"
         "dropbox-notes"
         )(add-to-list 'org-agenda-files (make-org-name it)))


(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)

(setq org-capture-templates (quote (("t" "Todo" entry (file "~/national/todo.org")
                                     "** TODO %?\n  %i\n " )
                                    ("e" "Emacs" entry (file "~/national/emacs.org")
                                     "** TODO %?\n  %i\n " )
                                    ("h" "Home" entry (file "~/national/home.org")
                                     "** TODO %?\n  %i\n " )
                                    ("i" "Tickler" entry (file "~/national/tickler.org")
                                     "** %?\n  %i\n " )
                                    )))

(setq org-agenda-skip-scheduled-if-done t)

(provide 'dreamacs-org)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/national")

;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/flagged.org")

;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; (require 'org-agenda)


(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (org . t)
   (emacs-lisp . t)
   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (octave . t)
   (sqlite . t)
   (perl . t)
   ))

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
      '((sequence "TODO(t)" "WAITING(w@/!)" "|" "DONE(d!)" "DELEGATED(d@)" "CANCELED(c@)")))

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

;; dreamacs-org.el ends here


(setq org-agenda-include-diary t)
