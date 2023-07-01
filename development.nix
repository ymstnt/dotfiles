{ config, pkgs, home-manager, ... }:

let
  unstable = import <nixos-unstable> { config = config.nixpkgs.config; };
in
{
  programs.adb.enable = true;

  home-manager.users.ymstnt = {
    programs.vscode = {
      enable = true;
      package = unstable.pkgs.vscodium;
    };

    home.packages = with pkgs; [
      gcc
      gnumake
      unstable.rustc
      unstable.cargo
      python3
      python311Packages.pip
      nodejs
      openjdk19
      gradle
      dotnet-sdk
      flutter
      sqlite
      dbeaver
      unstable.bun
      unstable.gum
    ];
  };
}
