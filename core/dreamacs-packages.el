(require 'package)


(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" .
               "http://marmalade-repo.org/packages/"))
(setq package-user-dir (expand-file-name "elpa" dreamacs-base-dir))
(package-initialize)


(defvar dreamacs-packages '(
			    ace-jump-mode ack-and-a-half anzu
					  browse-kill-ring
					  dash diminish elisp-slime-nav
					  epl expand-region flycheck gist
					  gitconfig-mode gitignore-mode grizzl
					  guru-mode projectile
					  magit move-text rainbow-mode
					  paredit undo-tree
					  volatile-highlights
					  flx-ido
					  ))



(defun dreamacs-require-package (package)
  "Install PACKAGE unless already installed."
  (unless (memq package dreamacs-packages)
    (add-to-list 'dreamacs-packages package))
  (unless (package-installed-p package)
    (package-install package))
  (require package))

(defun dreamacs-packages-installed-p ()
  "Check if all packages in `dreamacs-packages' are installed."
  (every #'package-installed-p dreamacs-packages))

(defun dreamacs-require-packages (packages)
  (mapc #'dreamacs-require-package packages))

(defun dreamacs-install-packages ()
  "Install all packages listed in `dreamacs-packages'."
  (unless (dreamacs-packages-installed-p)
    ;; check for new packages (package versions)
    (message "%s" "Dreamacs is now refreshing its package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    ;; install the missing packages
    (dreamacs-require-packages dreamacs-packages)))

(dreamacs-install-packages)

(defmacro dreamacs-auto-install (extension package mode)
  "When file with EXTENSION is opened triggers auto-install of PACKAGE.
PACKAGE is installed only if not already present.  The file is opened in MODE."
  `(add-to-list 'auto-mode-alist
                `(,extension . (lambda ()
                                 (unless (package-installed-p ',package)
                                   (package-install ',package))
                                 (,mode)))))

(defmacro dreamacs-auto-install (extension package mode)
  "When file with EXTENSION is opened triggers auto-install of PACKAGE.
PACKAGE is installed only if not already present.  The file is opened in MODE."
  `(add-to-list 'auto-mode-alist
                `(,extension . (lambda ()
                                 (unless (package-installed-p ',package)
                                   (package-install ',package))
                                 (,mode)))))

(defvar dreamacs-auto-install-alist
  '(("\\.clj\\'" clojure-mode clojure-mode)
    ("\\.coffee\\'" coffee-mode coffee-mode)
    ("\\.css\\'" css-mode css-mode)
    ("\\.csv\\'" csv-mode csv-mode)
    ("\\.d\\'" d-mode d-mode)
    ("\\.dart\\'" dart-mode dart-mode)
    ("\\.erl\\'" erlang erlang-mode)
    ("\\.feature\\'" feature-mode feature-mode)
    ("\\.go\\'" go-mode go-mode)
    ("\\.groovy\\'" groovy-mode groovy-mode)
    ("\\.haml\\'" haml-mode haml-mode)
    ("\\.hs\\'" haskell-mode haskell-mode)
    ("\\.latex\\'" auctex LaTeX-mode)
    ("\\.less\\'" less-css-mode less-css-mode)
    ("\\.lua\\'" lua-mode lua-mode)
    ("\\.markdown\\'" markdown-mode markdown-mode)
    ("\\.md\\'" markdown-mode markdown-mode)
    ("\\.ml\\'" tuareg tuareg-mode)
    ("\\.pp\\'" puppet-mode puppet-mode)
    ("\\.php\\'" php-mode php-mode)
    ("PKGBUILD\\'" pkgbuild-mode pkgbuild-mode)
    ("\\.sass\\'" sass-mode sass-mode)
    ("\\.scala\\'" scala-mode2 scala-mode)
    ("\\.scss\\'" scss-mode scss-mode)
    ("\\.slim\\'" slim-mode slim-mode)
    ("\\.textile\\'" textile-mode textile-mode)
    ("\\.yml\\'" yaml-mode yaml-mode)))

;; markdown-mode doesn't have autoloads for the auto-mode-alist
;; so we add them manually if it's already installed
(when (package-installed-p 'markdown-mode)
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode)))

(when (package-installed-p 'pkgbuild-mode)
  (add-to-list 'auto-mode-alist '("PKGBUILD\\'" . pkgbuild-mode)))

;; build auto-install mappings
(mapc
 (lambda (entry)
   (let ((extension (car entry))
         (package (cadr entry))
         (mode (cadr (cdr entry))))
     (unless (package-installed-p package)
       (dreamacs-auto-install extension package mode))))
 dreamacs-auto-install-alist)


(provide 'dreamacs-packages)
