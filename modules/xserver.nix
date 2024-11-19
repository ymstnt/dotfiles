{ pkgs, ... }:

{
 services.xserver = {
    enable = true;
    xkb = {
      layout = "hu";
      variant = "";
    };
    excludePackages = with pkgs; [
      xterm
    ];
    wacom.enable = true;
  };
}
