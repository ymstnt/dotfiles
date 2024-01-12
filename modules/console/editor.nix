{ outputs, home-manager, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  home-manager.users.ymstnt = {
    programs.micro = {
      enable = true;
      settings = {
        statusformatl = "$(filename) $(modified)($(line)/$(lines),$(col)) $(status.paste)| ft:$(opt:filetype) | $(opt:fileformat) | $(opt:encoding)";
        tabstospaces = true;
        tabsize = 2;
      };
    };
  };
}