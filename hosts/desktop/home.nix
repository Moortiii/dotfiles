{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/vscode.nix
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
    libgcc
    python312
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
