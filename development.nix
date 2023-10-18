{ config, pkgs, home-manager, nixpkgs-unstable, nixpkgs-develop, ... }:

{
  programs.adb.enable = true;

  home-manager.users.ymstnt = {
    programs.vscode = {
      enable = true;
      package = nixpkgs-unstable.pkgs.vscodium;
    };

    home.packages = with pkgs; [
      gcc
      gnumake
      rustc
      cargo
      python3
      python311Packages.pip
      nodejs
      openjdk19
      gradle
      dotnet-sdk
      flutter
      sqlite
      dbeaver
      nixpkgs-unstable.bun
    ];
  };
}
