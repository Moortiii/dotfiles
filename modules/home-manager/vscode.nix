{ pkgs, ... }:
{
    programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
    userSettings = {
      "editor.formatOnSave" = true;
      "workbench.iconTheme" = "material-icon-theme";
      "workbench.colorTheme" ="One Dark Pro";
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
    ];
  };
}