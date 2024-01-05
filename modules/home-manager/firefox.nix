{ pkgs, inputs, ...}:
{
    programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        settings = {
          "browser.startup.homepage" = "google.no";
        };
        extensions = with inputs.firefox-addons.packages.${pkgs.system}; [ ublock-origin bitwarden ]; 
      };
    };
  };
}