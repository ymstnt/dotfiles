{ pkgs, ... }:

{
  programs.adb.enable = true;

  hm = {
    home.packages = (with pkgs; [
      gcc
      gnumake
      cmake
      ninja
      appimage-run
      rustc
      cargo
      python3
      ffmpeg
      nodejs
      openjdk19
      gradle
      dotnet-sdk
      flutter
      sqlite
      dbeaver-bin
      bun
      gum
      zed-editor
      zola
    ]) ++ (with pkgs.python311Packages; [
      pikepdf
      pip
    ]);
  };
}
