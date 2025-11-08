{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
    protonvpn-gui
    protonmail-desktop
  ];

  services.protonmail-bridge = {
    enable = true;
    path = [ pkgs.gnome-keyring ];
  };
}
