{ outputs, pkgs, hm, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  hm.programs.zoxide = {
    enable = true;
  };
}
