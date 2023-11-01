{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./host.nix
      ./modules/shell/cli.nix
      ./modules/DMs/gnome.nix
      ./modules/development.nix
      ./modules/applications.nix
    ];
}
