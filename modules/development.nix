{ pkgs, ... }:

{
  programs.adb.enable = true;

  hm = {
    home.packages = (with pkgs; [
      appimage-run
      bun
      cargo
      cmake
      dbeaver-bin
      dotnet-sdk_8
      ffmpeg
      flutter
      gcc
      gnumake
      go
      gox
      gradle
      gum
      minicom
      ninja
      nodejs
      python3
      rustc
      sqlite
      thonny
      zed-editor
      zola
    ]) ++ (with pkgs.python311Packages; [
      pikepdf
      pip
    ]) ++ (with pkgs.jetbrains; [
      rider
    ]);
  };
}
