{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/git.nix
  ];

  home.username = "mha";
  home.homeDirectory = "/home/mha";
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
