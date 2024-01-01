# Dotfiles

Repository for NixOS configuration that can be used to fully bootstrap a new / existing system.

Run the following command:

```
sudo nixos-rebuild --flake ./dotfiles#desktop
```

# TODO:

* Automatically set up Firefox with settings (no password saving) + default extensions
* Configure VSCode Key Bindings
* Configure VSCode default extensions and configuration
* Configure ewwbar
* Configure i3lock
* Remove failing i3blocks
* Configure wallpaper
* Set up default folders, maybe download a given set of repositories immediately, e.g. advent of code?
* Pyenv setup
* Poetry setup
* Docker setup
* How does Pants work with all of this?
* Picom with transparency for inactive applications and terminals
