{ pkgs, ... }:

{
  hm.programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    profiles.default = {
      userSettings = {
        "editor.formatOnPaste" = true;
        "editor.formatOnSave" = true;
        "editor.formatOnType" = true;
        "workbench.preferredDarkColorTheme" = "Default Dark Modern";
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "editor.tabSize" = 2;
        "editor.detectIndentation" = false;
        "git.enableSmartCommit" = true;
        "terminal.integrated.fontFamily" = "'JetbrainsMonoNL NF', 'FiraCode Nerd Font', 'FiraCode NF', 'Consolas'";
        "editor.wordWrap" = "on";
        "telemetry.telemetryLevel" = "off";
        "editor.inlineSuggest.enabled" = true;
        "window.titleBarStyle" = "custom";
        "breadcrumbs.enabled" = false;
        "workbench.tree.indent" = 12;
        "workbench.preferredLightColorTheme" = "Default Light Modern";
        "window.title" = "\${rootPath}\${separator}Code";
        "editor.renderLineHighlight" = "none";
        "editor.accessibilitySupport" = "off";
        "markdown.extension.toc.updateOnSave" = false;
        "diffEditor.ignoreTrimWhitespace" = false;
        "terminal.integrated.defaultProfile.linux" = "zsh";
        "syncSettings.gitInitMessage" = "profile({{profile}}): init -- {{now|date:iso}}";
        "syncSettings.gitUpdateMessage" = "profile({{profile}}): update -- {{now|date:iso}}";
        "syncSettings.resources" = [ 
          "extensions"
          "keybindings"
          "settings"
          "snippets"
          "uiState"
        ];
        "workbench.colorTheme" = "Default Dark Modern";
        "[astro]"."editor.defaultFormatter" = "astro-build.astro-vscode";
        "[css]"."editor.defaultFormatter" = "vscode.css-language-features";
        "workbench.editor.empty.hint" = "hidden";
        "security.workspace.trust.untrustedFiles" = "open";
        "[javascript]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.renderWhitespace" = "all";
        "[html]"."editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      extensions = (with pkgs.vscode-extensions; [
        dart-code.dart-code
        dart-code.flutter
        dbaeumer.vscode-eslint
        donjayamanne.githistory
        esbenp.prettier-vscode
        jnoortheen.nix-ide
        mechatroner.rainbow-csv
        mikestead.dotenv
        ms-dotnettools.csharp
        ms-python.isort
        ms-python.python
        ritwickdey.liveserver
        tomoki1207.pdf
        yzhang.markdown-all-in-one
        # Themes
        piousdeer.adwaita-theme
      ]) ++ (with pkgs.stable.vscode-extensions; [
        astro-build.astro-vscode
      ]);
    };
  };
}
