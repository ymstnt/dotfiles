{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    cantarell-fonts
    corefonts
    dejavu_fonts
    inter
    jetbrains-mono
    mplus-outline-fonts.githubRelease
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    proggyfonts
    source-code-pro
    source-sans
    twemoji-color-font
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "NerdFontsSymbolsOnly" ]; })
  ];
  # Enable fontDir for Flatpak
  fonts.fontDir.enable = true;
}
