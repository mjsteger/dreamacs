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
(defvar dreamacs-base-dir (expand-file-name (or (getenv "DREAMACS_PATH") "~/dreamacs"))

    "The root directory of dreamacs")
(defvar dreamacs-core-dir (expand-file-name "core" dreamacs-base-dir)
  "The home of Dreamacs's core functionality.")
(defvar dreamacs-savefile-dir (expand-file-name "savefile" dreamacs-base-dir)
  "This folder stores all the automatically generated save/history-files.")
(defvar dreamacs-modules-dir (expand-file-name  "modules." dreamacs-base-dir)
  "This directory houses all of the built-in Dreamacs modules.")
(defvar dreamacs-modules-file (expand-file-name "dreamacs-modules.el" dreamacs-base-dir)
  "This files contains a list of modules that will be loaded by Dreamacs.")

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

;;; dreamacs.el ends here
