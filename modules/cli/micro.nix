{ outputs, hm, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  hm.programs.micro = {
    enable = true;
    settings = {
      statusformatl = "$(filename) $(modified)($(line)/$(lines),$(col)) $(status.paste)| ft:$(opt:filetype) | $(opt:fileformat) | $(opt:encoding)";
      tabstospaces = true;
      tabsize = 2;
    };
  };
}
