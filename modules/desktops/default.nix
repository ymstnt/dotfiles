{ ... }:

{
  imports = [
    ./gnome.nix
  ];

  services.xserver = {
    enable = true;
    xkb = {
      layout = "hu";
      variant = "";
    };
    wacom.enable = true;
    displayManager = {
      #defaultSession = "xfce";
      gdm.enable = true;
    };
    desktopManager = {
      gnome.enable = true;
      #xfce.enable = true;
    };
  };
}
