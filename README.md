# xmonad-xmobar config


## Synopsis

My personal xmonad and xmobar configuration (Haskell)


## Description

Because I use them together, I keep the configuration for both
xmonad and xmobar in the same `.xmonad` directory. This is a repo
of my work on these files.


## Getting it

If you want to use this repo as-is, not just for inspiration, it's
intended to be cloned into the customary `.xmonad` dot-directory. A
symlink can then be used to let xmobar find its config file. Do this:

    $ cd
    $ darcs clone http://hub.darcs.net/dino/xmonad-xmobar-conf .xmonad
    $ ln -s .xmonad/xmobarrc .xmobarrc

You will then need to edit the `iconRoot` field in `.xmonad/xmobarrc`
to reflect your home directory.


## Contact

Dino Morelli <[dino@ui3.info](mailto:dino@ui3.info)>
