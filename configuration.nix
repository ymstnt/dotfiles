{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./host.nix
      ./cli.nix
      ./desktop.nix
      ./development.nix
      ./applications.nix
    ];
}
