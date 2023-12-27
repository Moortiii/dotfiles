# Dotfiles

**Prerequisites**:

The setup is developed for Ubuntu 22.04 using i3-wm, currently at version 4.22 (2023-01-02).

**Requirements**:

* i3wm (window manager)
* i3bar (status bar)
* i3blocks (status command for i3bar)
* pulseaudio (audio management)
* alsamixer (audio management)
* i3lock (lockscreen)
* xsslock (screensaver)
* nitrogen (wallpaper management)
* dmenu (application menu)
* fonts-font-awesome (glyphs)
* brightnessctl (brightness control)
* picom (compositor)

**Where to put the various files**:

i3/config -> $HOME/.config/i3/config
i3blocks/config -> $HOME/.config/i3blocks/config
i3blocks-components/* -> /usr/share/i3blocks/*
picom/picom.conf -> $HOME/.config/picom.conf
wallpaper -> $HOME/Pictures/wallpaper.png
scripts/* -> $HOME/scripts

**Locking the screen**:

The scripts folder contains a custom wrapper for i3lock that takes an input image and converts it to the correct resolution and feeds it as the image to use for the lockscreen. This allows us to have our lockscreen appear identical to our background image without introducing scaling issues (since only tiling / non-tiling mode is supported by i3lock out of the box).

The lock script is bound to $Mod + L and is also used by xsslock to lock the screen after a period of inactivity.

**Controlling brightness**:

Add the following to `/etc/udev/rules.d/backlight.rules` in order to allow `brightnessctl` to control the brightness without running as sudo:

```
ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp sudo $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"
```

This allows anyone in the `sudoers` file to control the brightness directly. The function keys are using `XF86MonBrightnessUp` and `XF86MonBrightnessDown` as the keys, which should work on most hardware.

**Controlling the audio**:

Assuming pulseaudio is available and responsible for audio management, you should be able to control audio out of the box using the function keys. In addition to this the following options are available:

* Scroll up on the volume indicator in the status bar to raise the volume
* Scroll down on the volume indicator in the status bar to lower the volume
* Right click on the volume indicator in the status bar to mute / unmute the sink

This will use the current "Master" sink, which means that it will switch to adjusting headphones when they are plugged in.

