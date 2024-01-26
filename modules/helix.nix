{ outputs, hm, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  hm.programs.helix = {
    enable = true;
  };
}
