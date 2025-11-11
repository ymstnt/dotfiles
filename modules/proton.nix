{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
    protonvpn-gui
    protonmail-desktop
  ];

  # Configure it with protonmail-bridge --cli
  # Then exit, and systemctl --user enable protonmail-bridge.service
  # systemctl --user start protonmail-bridge.service
  # If needed to reconfigure, systemctl --user stop protonmail-bridge.service
  services.protonmail-bridge = {
    enable = true;
    path = [ pkgs.gnome-keyring ];
  };
}
