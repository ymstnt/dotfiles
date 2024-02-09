{ config, nixpkgs-develop-fcast, pkgs, ... }:
{
  imports = [
    "${nixpkgs-develop-fcast}/nixos/modules/programs/fcast-receiver.nix" # TODO: change this to nixpkgs-master once https://github.com/NixOS/nixpkgs/pull/283513 is merged
  ];

  programs.fcast-receiver = {
    enable = true;
    openFirewall = true;
    package = pkgs.develop-fcast.fcast-receiver;
  };
}
