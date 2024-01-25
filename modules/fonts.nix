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
    corefonts
    (nerdfonts.override { fonts = [ "FiraCode" "JetBrainsMono" ]; })
  ];
  # Enable fontDir for Flatpak
  fonts.fontDir.enable = true;
}
