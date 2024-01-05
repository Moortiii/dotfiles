{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/vscode.nix
    ../../modules/home-manager/eww/eww.nix
    ../../modules/home-manager/picom/picom.nix
    ../../modules/home-manager/i3/i3.nix
    ../../modules/home-manager/i3blocks/i3blocks.nix
  ];

  home.username = "mha";
  home.homeDirectory = "/home/mha";
  home.stateVersion = "23.11";

  home.packages = with pkgs; [
    alacritty
    discord
    eww
    htop
    ranger
    spotify
    poetry
    python312
    dunst # Notification Daemon
    libnotify # Library to send Notifications
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # programs.firefox = {
  #   enable = true;
  #   profiles = {
  #     default = {
  #       id = 0;
  #       settings = {
  #         "browser.startup.homepage" = "startsiden.no";
  #       };
  #       # extensions = with nur.repos.rycee.firefox-addons; [ ublock-origin ];
  #     };
  #   };
  # };
}
