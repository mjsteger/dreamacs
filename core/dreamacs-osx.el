
(dreamacs-require-packages '(exec-path-from-shell))

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(menu-bar-mode +1)

(setq mac-command-modifier 'meta)

(provide 'dreamacs-osx)
(defun get-buffer-substring-for-line (&optional line)
  (save-excursion
    (when line
      (goto-line line))
    (buffer-substring-no-properties (line-beginning-position) (line-end-position)))
  )
(defun number-lines-for-buffer ()
  (count-lines (point-min) (point-max))
  )

;; (--each (with-temp-buffer
;;           (-each '("~/.zshrc" "~/.bashrc") (lambda (x)
;;                                              (when (file-exists-p x)
;;                                                (insert-file-contents-literally x)
;;                                                (let ((result '()))
;;                                                  (dotimes (linenum (1+ (number-lines-for-buffer)) result)
;;                                                    (let ((current-buffer-line-string (get-buffer-substring-for-line linenum)))
;;                                                      (when (s-starts-with? "export" current-buffer-line-string)
;;                                                        (string-match "export \\([^=]+\\)=" current-buffer-line-string)
;;                                                        (add-to-list 'result (match-string 1 current-buffer-line-string)))
;;                                                      ))))
;;                                              (add-to-list 'exec-path-from-shell-variables it)))))
