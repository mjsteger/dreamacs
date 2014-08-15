(dreamacs-require-packages '(znc erc-image erc-hl-nicks))

(add-to-list 'erc-modules 'image)
(add-to-list 'erc-modules 'hl-nicks)
(erc-update-modules)


(provide 'dreamacs-erc)
