{ pkgs, ... }:

{
  hm = {
    home.packages = (with pkgs; [
      android-tools
      appimage-run
      bruno
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
      ruby
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
