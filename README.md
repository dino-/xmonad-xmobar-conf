# xmonad-xmobar config


## Synopsis

My personal xmonad and xmobar configuration (Haskell)


## Description

Because I use them together, I keep the configuration for both
xmonad and xmobar in the same `.xmonad` directory. This is a repo
of my work on these files.

The PNG files in `util/resources` are the sources of the XPM
bitmaps in `resources`. You can use these to work on artwork if
you like.


## Getting it

If you want to use this repo as-is, not just for inspiration, it's
intended to be cloned into the customary `.xmonad` dot-directory. A
symlink can then be used to let xmobar find its config file. Do this:

    $ cd
    $ git clone https://github.com/dino-/xmonad-xmobar-conf.git .xmonad
    $ ln -s .xmonad/xmobarrc .xmobarrc

You will then need to edit the `iconRoot` field in `.xmonad/xmobarrc`
to reflect your home directory.


## Icon artwork and licensing

All of the icon artwork originals (in the `util/resources` directory)
were acquired from [IconArchive](http://www.iconarchive.com)
with the exception of `gnome_cpu_24.png`, which came from
[findicons.com](http://findicons.com/icon/188802/gnome_cpu#). They
were then converted to XPM by me with the GIMP or ImageMagick.

The original PNG files are included and the breakdown of licensing
for these files is as follows:

    icon original                    author               license
    ---------------------------------------------------------------------------------
    actions-arrow-down-icon_24.png   Oxygen Team          LGPL
    actions-arrow-up-icon_24.png     Oxygen Team          LGPL
    actions-speaker-icon_24.png      Oxygen Team          LGPL
    arch-linux-icon_24.png           Fatcow Web Hosting   CC BY 4.0
    battery-full-icon_24.png         Fatcow Web Hosting   CC BY 4.0
    battery-plug-icon_24.png         Fatcow Web Hosting   CC BY 4.0
    calendar-clock-icon_24.png       paomedia             public domain
    drop-icon_24.png                 paomedia             public domain
    gnome_cpu_24.png                 AMAZIGH Aneglus      GPL
    harddisk-icon_24.png             Oxygen Team          LGPL
    memory-icon_24.png               Double-J Design      CC BY 4.0
    microphone-icon_24.png           Creative Freedom     CC BY-ND 4.0
    network-icon_24.png              Iconshock            free for non-commercial use
    places-mail-message-icon_24.png  Oxygen Team          LGPL
    spam-icon_24.png                 Fatcow Web Hosting   CC BY 4.0
    sun-rain-icon_24.png             Fatcow Web Hosting   CC BY 4.0
    thermometer-icon_24.png          Aha-Soft             CC BY 4.0
    ubuntu-icon-circle-white_24      Martz90              CC BY-NC-ND 4.0
    ubuntu-icon-multi_24             Saki                 GPL

Author pages, where available:

- [Aha-Soft](http://www.aha-soft.com/)
- [Creative Freedom](https://www.creativefreedom.co.uk/)
- [Double-J Design](http://www.doublejdesign.co.uk/)
- [Fatcow Web Hosting](http://www.fatcow.com/free-icons)
- [Martz90](http://martz90.deviantart.com/)
- [paomedia](http://www.paomedia.com/)
- [sa-ki](http://sa-ki.deviantart.com/)

Licenses:

- [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
- [CC BY-NC-ND 4.0](https://creativecommons.org/licenses/by-nc-nd/4.0/)
- [CC BY-ND 4.0](https://creativecommons.org/licenses/by-nd/4.0/)
- [GPL](https://gnu.org/licenses/gpl.html)
- [LGPL](https://www.gnu.org/copyleft/lesser.html)


## Build issues

### xmonad

Around 2017-06-26 I experienced a build failure on Arch Linux with
stale libraries in the default, systemwide ghc. There were linker
errors in the `xmonad.errors` build log. Some searching brought
me to [this page](https://bugs.archlinux.org/task/54561) and it
may be good to keep this around, an "emergency" dynamic binary
compilation command:

    $ cd ~/.xmonad
    $ ghc --make xmonad.hs -i -ilib -dynamic -fforce-recomp -main-is main -v0 -o xmonad-x86_64-linux


### xmobar

To support all of the features I'm using in xmobar, it was necessary to build
with some extra flags.

    build flag      xmobar feature
    -------------------------------------
    with_alsa       Volume command
    with_datezone   DateZone command
    with_inotify    Mail command
    with_xft        Font support for xft
    with_xpm        Support for xpm icons

Example build command:

    $ stack install --flag xmobar:with_alsa --flag xmobar:with_datezone --flag xmobar:with_xft --flag xmobar:with_xpm xmobar

If this fails to make a viable build plan, it may be necessary to get the
source code locally and have stack make a `stack.yaml` file first.

Get the source with `stack unpack` or from GitHub and then build with:

    $ stack install --flag xmobar:with_datezone --flag xmobar:with_inotify --flag xmobar:with_xft --flag xmobar:with_xpm xmobar


## Contact

Dino Morelli <[dino@ui3.info](mailto:dino@ui3.info)>
