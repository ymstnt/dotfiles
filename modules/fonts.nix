{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-serif
    noto-fonts-cjk-sans
    #google-fonts
    noto-fonts-emoji
    mplus-outline-fonts.githubRelease
    proggyfonts
    jetbrains-mono
    corefonts
    cantarell-fonts
    dejavu_fonts
    source-code-pro
    source-sans
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" "NerdFontsSymbolsOnly" ]; })
  ];
  # Enable fontDir for Flatpak
  fonts.fontDir.enable = true;
}
