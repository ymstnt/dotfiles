{ config, pkgs, ... }:

{
  imports =
    [
      <home-manager/nixos>
      /etc/nixos/hardware-configuration.nix
      /etc/nixos/host.nix
      ./cli.nix
      ./desktop.nix
      ./development.nix
      ./applications.nix
    ];
}
