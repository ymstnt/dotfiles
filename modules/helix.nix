{ pkgs, ... }:

{
  hm.programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "dark_plus";
      editor = {
        lsp.display-messages = true;
        bufferline = "always";
        auto-format = true;
        cursor-shape = {
          insert = "bar";
          select = "underline";
        };
        file-picker = {
          hidden = false;
        };
        whitespace = {
          render = "all";
          characters = {
            space = "·";
            nbsp = "⍽";
            nnbsp = "␣";
            tab = "→";
            newline = "󰌑";
            tabpad = "·";
          };
        };
      };
      keys.normal = {
        space.space = "file_picker";
        space.q = ":q";
      };
    };
    languages.language = [
      {
        name = "c-sharp";
        indent = {
          tab-width = 2;
          unit = "  ";
        };
      }
    ];
    extraPackages = (with pkgs; [
      ansible-language-server
      bash-language-server
      cmake-language-server
      dockerfile-language-server-nodejs
      efm-langserver
      gopls
      kotlin-language-server
      lua-language-server
      marksman
      netcoredbg
      nil
      nixpkgs-fmt
      rust-analyzer
      texlab
      vscode-langservers-extracted
      yaml-language-server
      omnisharp-roslyn
    ]) ++ (with pkgs.nodePackages; [
      typescript-language-server
    ]) ++ (with pkgs.python3Packages; [
      python-lsp-server
    ]);
  };
}
