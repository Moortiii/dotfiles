#!/bin/sh
xrandr --output eDP-1 --off
xrandr --output DP-1 --mode 5120x1440
/home/mha/scripts/alt-monitor.sh
nitrogen --restore
