Shamelessly cribbed from the much superior prelude

The simplest way to "install" and get this working is to simply symlink the startup file(dotemacs.el) this to your ~/.emacs like so:

```ln -s /path/to/dreamacs/dotemacs.el ~/.emacs```

Then add something like this to you bash_profile:

```export DREAMACS_PATH="~/code/dreamacs/"```

If you are new to emacs, I recommend using guru-mode, which will discourage/prevent you from using the "wrong" keybindings(that is, the arrow keys and other similarly "unemacs-y" keybindings). You can do this by putting the following into you
