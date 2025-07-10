{ pkgs, ... }:

{
  services.protonmail-bridge = {
    enable = true;
    path = with pkgs; [
      gnome-keyring
    ];
  };

  hm.home.packages = with pkgs; [
    protonmail-desktop
    protonvpn-gui
  ];
}
