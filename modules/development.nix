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
      deno
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
      typst
      xpipe
      zola
    ]) ++ (with pkgs.python3Packages; [
      pikepdf
      pip
    ]);
  };
}
