
;; We'll grab the rainbow delimiters package. I wonder what happens if this is over 80 characters. I really hope they do something smart

(dreamacs-require-packages '(rainbow-delimiters))

;; We'll want to use it everywhere, like so:


(define-globalized-minor-mode global-rainbow-delimiters-mode rainbow-delimiters-mode (lambda () (rainbow-delimiters-mode +1)))
(global-rainbow-delimiters-mode)
(custom-set-variables
 '(rainbow-delimiters-depth-1-face ((t (:foreground "red"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "green"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "violet"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "orange"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "brown"))))
 '(rainbow-delimiters-unmatched-face ((t (:foreground "alternateSelectedControlColor")))))

(provide 'dreamacs-rainbow-delimiters)
