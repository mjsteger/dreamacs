(dreamacs-require-packages '(wrap-region fixme-mode helm))

(wrap-region-global-mode t)
(helm-mode t)
(wrap-region-add-wrappers
 '(("$" "$")
   ("{-" "-}" "#")
   ("/" "/" nil ruby-mode)
   ("/* " " */" "#" (java-mode javascript-mode css-mode))
   ("`" "`" nil (markdown-mode ruby-mode))))

(exec-path-from-shell-copy-env "SSH_AGENT_PID")
(exec-path-from-shell-copy-env "SSH_AUTH_SOCK")
(eshell-command "ssh-add ~/.ssh/id_digitalocean")
(eshell-command "ssh-add ~/.ssh/id_rsa")

(provide 'dreamacs-editor-tweaks)
