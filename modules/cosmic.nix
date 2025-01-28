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

  hm.home.packages = (with pkgs; [
    forecast
  ]) ++ (with pkgs; [
    # GNOME apps
    file-roller
    gnome-font-viewer
    loupe
    nautilus
    papers
    simple-scan
  ]);
}
