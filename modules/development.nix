{ pkgs, ... }:

{
  programs.adb.enable = true;

  hm = {
    home.packages = with pkgs; [
      gcc
      gnumake
      cmake
      ninja
      appimage-run
      rustc
      cargo
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
      bun
      gum
    ];
  };
}
