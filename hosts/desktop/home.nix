{ config, pkgs, ... }:
let
  gitaware = builtins.fetchGit {
    url = "https://github.com/jimeh/git-aware-prompt";
    ref = "master";
    rev = "df8f218d4af51b1fac03f58bf0ddc776466312de";
  };
in
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

  programs.bash = {
    enable = true;
    bashrcExtra = ''
      export GITAWAREPROMPT=${gitaware.outPath}
      source ${gitaware.outPath}/main.sh
      export PS1="\[\]\n\[\033[1;32m\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\[\033[0m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ ";
    '';
  };
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
