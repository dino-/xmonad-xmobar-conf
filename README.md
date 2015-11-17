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
    $ darcs clone http://hub.darcs.net/dino/xmonad-xmobar-conf .xmonad
    $ ln -s .xmonad/xmobarrc .xmobarrc

You will then need to edit the `iconRoot` field in `.xmonad/xmobarrc`
to reflect your home directory.


## Icon artwork and licensing

All of the icon artwork originals (in the `util/resources` directory)
were acquired from [IconArchive](http://www.iconarchive.com)
with the exception of `gnome_cpu_24.png`, which came from
[findicons.com](http://findicons.com/icon/188802/gnome_cpu#). They
were then converted to XPM by me with the GIMP.

The original PNG files are included and the breakdown of licensing
for these files is as follows:

    icon original                    author               license
    ---------------------------------------------------------------------------------
    actions-arrow-down-icon_24.png   Oxygen Team          LGPL
    actions-arrow-up-icon_24.png     Oxygen Team          LGPL
    battery-full-icon_24.png         Fatcow Web Hosting   CC BY 4.0
    battery-plug-icon_24.png         Fatcow Web Hosting   CC BY 4.0
    calendar-clock-icon_24.png       paomedia             public domain
    drop-icon_24.png                 paomedia             public domain
    gnome_cpu_24.png                 AMAZIGH Aneglus      GPL
    harddisk-icon_24.png             Oxygen Team          LGPL
    memory-icon_24.png               Double-J Design      CC BY 4.0
    network-icon_24.png              Iconshock            free for non-commercial use
    sun-rain-icon_24.png             Fatcow Web Hosting   CC BY 4.0
    thermometer-icon_24.png          Aha-Soft             CC BY 4.0

Author pages, where available:

- [Aha-Soft](http://www.aha-soft.com/)
- [Double-J Design](http://www.doublejdesign.co.uk/)
- [Fatcow Web Hosting](http://www.fatcow.com/free-icons)
- [paomedia](http://www.paomedia.com/)

Licenses:

- [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
- [GPL](https://gnu.org/licenses/gpl.html)
- [LGPL](https://www.gnu.org/copyleft/lesser.html)


## Contact

Dino Morelli <[dino@ui3.info](mailto:dino@ui3.info)>
