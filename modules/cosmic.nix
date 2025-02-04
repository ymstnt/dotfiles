{ nixos-cosmic, cosmic-manager, pkgs, ... }:

{
  imports = [ nixos-cosmic.nixosModules.default ];

  hm.imports = [
    cosmic-manager.homeManagerModules.cosmic-manager
  ];

  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
  };

  programs.seahorse.enable = true;

  hm = {
    wayland.desktopManager.cosmic = {
      enable = false;
    };
    gtk = {
      enable = true;
      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };
    home.packages = (with pkgs; [
        forecast
    ]) ++ (with pkgs; [
        adw-gtk3
        # GNOME apps
        file-roller
        gnome-font-viewer
        loupe
        nautilus
        papers
        simple-scan
    ]);
  };
}
