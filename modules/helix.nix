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
      omnisharp-roslyn
      netcoredbg
      cmake-language-server
      nil
      nixpkgs-fmt
      gopls
      efm-langserver
      vscode-langservers-extracted
      dockerfile-language-server-nodejs
      kotlin-language-server
      texlab
      lua-language-server
      marksman
      rust-analyzer
      yaml-language-server
      ansible-language-server
    ]) ++ (with pkgs.nodePackages; [
      bash-language-server
      typescript-language-server
    ]) ++ (with pkgs.python311Packages; [
      python-lsp-server
    ]);
  };
}
