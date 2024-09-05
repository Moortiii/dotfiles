#!/bin/sh
xrandr --output DP-3 --off
xrandr --output eDP-1 --mode 1920x1200
xrandr --output DP-3 --off
xrandr --delmonitor DUMMY0-1
xrandr --delmonitor DUMMY0-2
xrandr --delmonitor DUMMY0-3
nitrogen --restore
