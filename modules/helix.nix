{ pkgs, ... }:

{
  hm.programs.helix = {
    enable = true;
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
      };
      keys.normal = {
        space.space = "file_picker";
        space.q = ":q";
      };
    };
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
    ]) ++ (with pkgs.python311Packages; [
      python-lsp-server
    ]);
  };
}
