{ outputs, pkgs, hm, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  programs.adb.enable = true;

  hm = {
    programs.vscode = {
      enable = true;
      package = pkgs.unstable.vscodium;
    };

    home.packages = with pkgs; [
      gcc
      gnumake
      cmake
      ninja
      appimage-run
      unstable.rustc
      unstable.cargo
      python3
      python311Packages.pip
      ffmpeg
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
