{ config, pkgs, home-manager, ... }:

let
  unstable = import <nixos-unstable> { config = config.nixpkgs.config; };
in
{
  services.ratbagd.enable = true;
  programs.steam.enable = true;

  home-manager.users.ymstnt = {
    home.packages = with pkgs; [
      unstable.prismlauncher
      piper
    ];
  };
}
