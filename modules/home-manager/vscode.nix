{ pkgs, ... }:
{
    programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    userSettings = {
      "editor.formatOnSave" = true;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" ="One Dark Pro";
      "window.zoomLevel" = 1;
      "[python]" = {
        "editor.rulers" = [88];
        "editor.formatOnSave" = true;
        "editor.defaultFormatter" = "charliermarsh.ruff";
      };
    };
    keybindings = [
      {
        "key" = "ctrl+e";
        "command" = "-workbench.action.quickOpen";
      }
      {
          "key" = "meta+up";
          "command" = "editor.action.moveLinesUpAction";
          "when" = "editorTextFocus && !editorReadonly";
      }
      {
          "key" = "alt+up";
          "command" = "-editor.action.moveLinesUpAction";
          "when" = "editorTextFocus && !editorReadonly";
      }
      {
          "key" = "meta+down";
          "command" = "editor.action.moveLinesDownAction";
          "when" = "editorTextFocus && !editorReadonly";
      }
      {
          "key" = "alt+down";
          "command" = "-editor.action.moveLinesDownAction";
          "when" = "editorTextFocus && !editorReadonly";
      }
    ];
    extensions = with pkgs.vscode-extensions; [
      pkief.material-icon-theme
      zhuangtongfa.material-theme
      bbenoist.nix
      charliermarsh.ruff
      ms-python.python
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "yuck";
        publisher = "eww-yuck";
        version = "0.0.3";
        sha256 = "sha256-DITgLedaO0Ifrttu+ZXkiaVA7Ua5RXc4jXQHPYLqrcM=";
      }
    ];
  };
}