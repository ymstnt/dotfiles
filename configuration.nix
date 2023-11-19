{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./system.nix
      ./modules/cli/cli.nix
      ./modules/desktops/gnome.nix
      ./modules/development.nix
      ./modules/applications.nix
    ];
}
