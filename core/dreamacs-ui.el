(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(menu-bar-mode -1)

(blink-cursor-mode -1)

(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; make the fringe (gutter) smaller
;; the argument is a width in pixels (the default is 8)
(if (fboundp 'fringe-mode)
    (fringe-mode 4))

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " Dreamacs - " (:eval (if (buffer-file-name)
                                            (abbreviate-file-name (buffer-file-name))
                                          "%b"))))

(provide 'dreamacs-ui)
