#!/bin/sh
xrandr --output eDP-1 --off
xrandr --output DP-3 --mode 5120x1440
/home/mha/scripts/monitor.sh
nitrogen --restore
