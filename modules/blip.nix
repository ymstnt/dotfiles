{ blip, ... }:

{
  imports = [ blip.nixosModules.default ];

  programs.blip.enable = true;
}
