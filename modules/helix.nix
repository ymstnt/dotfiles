{ outputs, hm, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  hm.programs.helix = {
    enable = true;
    settings = {
      theme = "dark_plus";
      editor = {
        lsp.display-messages = true;
      };
      keys.normal = {
        space.space = "file_picker";
        space.q = ":q";
      };
    };
  };
}
