{ outputs, pkgs, home-manager, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  programs.adb.enable = true;

  home-manager.users.ymstnt = {
    programs.vscode = {
      enable = true;
      package = pkgs.unstable.vscodium;
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
