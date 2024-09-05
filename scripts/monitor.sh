#!/bin/bash
xrandr --output eDP-1 --off
xrandr --output eDP-1 --mode 1920x1080
xrandr --output eDP-1 --off
xrandr --setmonitor DUMMY0-1 1280/400x1440/182+0+0 DP-3
xrandr --setmonitor DUMMY0-2 2560/400x1440/182+1280+0 none
xrandr --setmonitor DUMMY0-3 1280/400x1440/182+3840+0 none
