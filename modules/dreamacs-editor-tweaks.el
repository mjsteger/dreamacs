(dreamacs-require-packages '(wrap-region fixme-mode helm))

(wrap-region-global-mode t)
(helm-mode t)
(wrap-region-add-wrappers
 '(("$" "$")
   ("{-" "-}" "#")
   ("/" "/" nil ruby-mode)
   ("/* " " */" "#" (java-mode javascript-mode css-mode))
   ("`" "`" nil (markdown-mode ruby-mode))))

(provide 'dreamacs-editor-tweaks)
