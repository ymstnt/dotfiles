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
        y = "yank_to_clipboard";
        p = "paste_clipboard_after";
        P = "paste_clipboard_before";
        R = "replace_selections_with_clipboard";
        space.y = "yank";
        space.p = "paste_after";
        space.P = "paste_before";
        space.R = "replace_with_yanked";
      };
    };
    languages = {
      language-server = {
        emmet-lsp = with pkgs; {
          command = "${emmet-language-server}/bin/emmet-language-server";
          args = [ "--stdio" ];
        };
      };
      language = [
        {
          name = "c-sharp";
          indent = {
            tab-width = 2;
            unit = "  ";
          };
        }
        {
          name = "html";
          # roots = [ ".git" ];
          formatter = {
            command = "prettier";
            args = [ "--parser" "html" ];
          };
          language-servers = [ "vscode-html-language-server" "emmet-lsp" ];
        }
      ];
    };
    extraPackages = (with pkgs; [
      ansible-language-server
      bash-language-server
      cmake-language-server
      docker-compose-language-service
      dockerfile-language-server-nodejs
      efm-langserver
      emmet-language-server
      gopls
      intelephense
      kotlin-language-server
      lua-language-server
      marksman
      netcoredbg
      nil
      nixpkgs-fmt
      omnisharp-roslyn
      ruff
      rust-analyzer
      superhtml
      svelte-language-server
      taplo
      texlab
      tinymist
      vscode-langservers-extracted
      vue-language-server
      yaml-language-server
    ]) ++ (with pkgs.nodePackages; [
      typescript-language-server
    ]) ++ (with pkgs.python3Packages; [
      python-lsp-server
    ]);
  };
}
