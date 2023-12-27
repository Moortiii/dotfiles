#!/bin/bash
convert Pictures/wallpaper.png -resize 1920x1080 RGB:- | i3lock --raw 1920x1080:rgb --image /dev/stdin
