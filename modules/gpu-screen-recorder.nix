{ pkgs, ... }:

{
  programs.gpu-screen-recorder = {
    enable = true;
  };

  hm.home.packages = with pkgs; [
    gpu-screen-recorder-gtk
  ];
}
