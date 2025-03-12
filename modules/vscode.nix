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
      };
      extensions = (with pkgs.vscode-extensions; [
        dart-code.dart-code
        dart-code.flutter
        mikestead.dotenv
        donjayamanne.githistory
        ritwickdey.liveserver
        yzhang.markdown-all-in-one
        jnoortheen.nix-ide
        esbenp.prettier-vscode
        mechatroner.rainbow-csv
        tomoki1207.pdf
        ms-python.isort
        ms-python.python
        ms-dotnettools.csharp
        # Themes
        piousdeer.adwaita-theme
      ]) ++ (with pkgs.stable.vscode-extensions; [
        astro-build.astro-vscode
      ]);
    };
  };
}
