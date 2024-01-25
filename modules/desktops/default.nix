{ ... }:

{
  services.xserver = {
    enable = true;
    layout = "hu";
    xkbVariant = "";
    displayManager = {
      #defaultSession = "xfce";
      gdm.enable = true;
    };
    desktopManager = {
      gnome.enable = true;
      #xfce.enable = true;
    };
  };

  imports = [
    ./gnome.nix
  ];
}
