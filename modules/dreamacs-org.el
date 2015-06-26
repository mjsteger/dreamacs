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
      org-rubyflow-file (make-org-name "rubyflow.org")
      org-home-file (make-org-name "home.org"))

(--each (list
        org-tickler-file
        org-todo-file
        org-notes-file
        org-work-file
        org-home-file
        )(add-to-list 'org-agenda-files it))


(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c r") 'org-capture)
(setq org-capture-templates (quote (("t" "Todo" entry (file "~/national/todo.org")
                                     "** TODO %?\n  %i\n " )
                                    ("e" "Emacs" entry (file "~/national/emacs.org")
                                     "** TODO %?\n  %i\n " )
                                    ("h" "Home" entry (file "~/national/home.org")
                                     "** TODO %?\n  %i\n " )
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
