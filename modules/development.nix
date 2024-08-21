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
      dotnet-sdk
      ffmpeg
      flutter
      gcc
      gnumake
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
    ]);
  };
}
