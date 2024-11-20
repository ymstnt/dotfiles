{ nixos-cosmic, pkgs, ... }:

{
  imports = [ nixos-cosmic.nixosModules.default ];

  services = {
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;
  };

  programs.seahorse.enable = true;

  hm.home.packages = (with pkgs; [
    forecast
  ]);
}
