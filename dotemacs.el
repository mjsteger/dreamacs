;;; dreamacs.el --- Make using emacs a dream!

;; Copyright (C) 2014 Michael Steger

;; Author: Michael Steger <mjsteger1@gmail.com>
;; Maintainer: Michael Steger <mjsteger1@gmail.com>
;; Created: 20 Feb 2014
;; Version: 0.01
;; Keywords: package

(require 'cl)

(defun require-all (requirelist)
  (mapc #'require requirelist))

(defvar current-user
      (getenv
       (if (equal system-type 'windows-nt) "USERNAME" "USER")))

(when (version< emacs-version "24.1")
  (error "Dreamacs requires at least GNU Emacs 24.1"))
(defvar dreamacs-base-dir (expand-file-name (or (getenv "DREAMACS_PATH") (file-name-directory (file-truename (or load-file-name (buffer-file-name))))))
    "The root directory of dreamacs")
(defvar dreamacs-core-dir (expand-file-name "core" dreamacs-base-dir)
  "The home of Dreamacs's core functionality.")
(defvar dreamacs-savefile-dir (expand-file-name "savefile" dreamacs-base-dir)
  "This folder stores all the automatically generated save/history-files.")
(defvar dreamacs-modules-dir (expand-file-name  "modules" dreamacs-base-dir)
  "This directory houses all of the built-in Dreamacs modules.")
(defvar dreamacs-modules-file (expand-file-name "dreamacs-modules.el" dreamacs-base-dir)
  "This files contains a list of modules that will be loaded by Dreamacs.")
(defvar dreamacs-elpa-base (expand-file-name (concat dreamacs-base-dir "/elpa"))
  "This directory houses all the elpa files")

(defvar dreamacs-personal-modules '()
  "List of personal modules that will be required(that is, a file of the form dreamacs-$X is expected for every $X in this list) in during the loading of dreamacs. See dreamacs-modules.el for more info. It is expected that users will set this variable in their own config before dreamacs loads.")

(defvar dreamacs-personal-configurationless-modules '()
  "List of personal modules that are to be directly installed/required without any assosciated file expected for them. See dreamacs-modules.el for more info. It is expected that users will set this variable in their own config before dreamacs loads.")

(unless (file-exists-p dreamacs-savefile-dir)
  (make-directory dreamacs-savefile-dir))

(setq default-directory dreamacs-base-dir)
(normal-top-level-add-subdirs-to-load-path)

(require-all '(
	       dreamacs-packages
	       dreamacs-core
	       dreamacs-ui
	       dreamacs-editor
	       ))

(when (file-exists-p dreamacs-modules-file)
  (load dreamacs-modules-file))

(defun dreamacs-add-subfolders-to-load-path (parent-dir)
  "Add all level PARENT-DIR subdirs to the `load-path'."
  (dolist (f (directory-files parent-dir))
    (let ((name (expand-file-name f parent-dir)))
      (when (and (file-directory-p name)
                 (not (equal f ".."))
                 (not (equal f ".")))
        (add-to-list 'load-path name)
        (dreamacs-add-subfolders-to-load-path name)))))

;; add Dreamacs's directories to Emacs's `load-path'
(add-to-list 'load-path dreamacs-core-dir)
(add-to-list 'load-path dreamacs-modules-dir)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; OSX specific settings
(when (eq system-type 'darwin)
  (require 'dreamacs-osx))

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(pivotal-api-token "05a9ce767fee0faa47d4acc941b57bce")
 '(znc-servers (quote (("stegerwerks.org" 44444 nil ((stegerwerks "steggy" "thisismyircpasswordyayIrock1")))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq enable-recursive-minibuffers t)

;;; dreamacs.el ends here
