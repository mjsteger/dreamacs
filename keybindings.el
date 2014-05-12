; I don't really use vc, and magit-status is probably way more useful than vc-create-tag, which is the original keybinding
(global-set-key (kbd "C-x v s") 'magit-status)

(global-set-key (kbd "C-c C-v") 'eshell)

(global-set-key (kbd "C-c C-c") 'smex)

(global-set-key (kbd "C-c o") 'occur)

(global-set-key (kbd "M-m") 'move-beginning-of-line)

(global-set-key (kbd "C-a") 'back-to-indentation)

(global-set-key (kbd "M-g") 'goto-line)

(global-set-key (kbd "C-;") 'comment-or-uncomment-region)

(global-set-key (kbd "C-c C-t") 'fci-mode)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
