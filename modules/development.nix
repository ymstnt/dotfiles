{ inputs, outputs, config, pkgs, home-manager, ... }:

{
  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  programs.adb.enable = true;

  home-manager.users.ymstnt = {
    programs.vscode = {
      enable = true;
      package = unstable.pkgs.vscodium;
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
      unstable.bun
    ];
  };
}
