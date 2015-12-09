Shamelessly cribbed from the much superior prelude

The simplest way to "install" and get this working is to simply symlink the startup file(dotemacs.el) this to your ~/.emacs like so:

```ln -s /path/to/dreamacs/dotemacs.el ~/.emacs```

If you already have a .emacs, though, this could be undesirable - you don't want to lose the configuration you've painfully built up!

If so, you can set set up your .emacs to load against dreamacs, and then do whatever else you want, like:

```
(load "~/dreamacs/dotemacs")
; Other cool .emacs stuff
```

This is also the recommended way to add your own configurations to dreamacs, doing something like:

```
(defvar dreamacs-personal-dir (expand-file-name "personal" "~/.emacs.d/"))

(when (file-exists-p dreamacs-personal-dir)
  (message "Loading personal configuration files in %s..." dreamacs-personal-dir)
  (mapc 'load (directory-files dreamacs-personal-dir 't "^[^#].*el$")))
```

I'd also highly recommend you keep your .emacs.d in version control as well!

You can also set up dreamacs to load from an enviornment variable, by adding something like this to your {bash,zsh}_profile:

```export DREAMACS_PATH="~/code/dreamacs/"```
