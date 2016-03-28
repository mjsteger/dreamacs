(dreamacs-require-packages '(dired-subtree dired-details))
(require 'dired)

(define-key dired-mode-map (kbd "C-, i") 'dired-subtree-insert)
(define-key dired-mode-map (kbd "C-, d") 'dired-subtree-remove)
(define-key dired-mode-map (kbd "C-, p") 'dired-subtree-up)
(define-key dired-mode-map (kbd "C-, n") 'dired-subtree-down)

(require 'dired-details)
(dired-details-install)

;; Nice listing
(setq find-ls-option '("-print0 | xargs -0 ls -alhd" . ""))

;; Always copy/delete recursively
(setq dired-recursive-copies (quote always))
(setq dired-recursive-deletes (quote top))

;; Auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; Hide some files
(setq dired-omit-files "^\\..*$\\|^\\.\\.$")
(setq dired-omit-mode t)
;; Changing the way M-< and M-> work in dired
;; Instead of taking me to the very beginning or very end, they now take me to the first or last file.
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (next-line 2))

(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (next-line -1))

(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)

(provide 'dreamacs-dired)
