{ nixpkgs-nvidia, lib, ... }:

let
  pkgs-nvidia = import nixpkgs-nvidia { };
in
{
  hardware.nvidia.package = pkgs-nvidia.linuxPackages.nvidiaPackages.latest;

  boot.kernelPackages = lib.mkForce pkgs-nvidia.linuxPackages_6_6;
}
