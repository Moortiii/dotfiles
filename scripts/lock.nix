{ pkgs }:

pkgs.writeShellScriptBin "i3-custom-lock" ''
  convert ~/Pictures/wallpaper.png -resize 2560x1440 RGB:- | i3lock --raw 2560x1440:rgb --image /dev/stdin
''

