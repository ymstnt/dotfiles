{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
    bat
    bitwarden-cli
    btop
    codeberg-cli
    exiftool
    eza
    fastfetch
    gh
    glab
    glow
    gnupg
    hck
    nixpkgs-fmt
    nix-prefetch
    p7zip
    pfetch
    pop
    ripgrep
    skate
    smartmontools
    sof-firmware
    sshfs
    unrar
    unzip
    wget
    wl-clipboard
    xsel
    yt-dlp
    zfxtop
    zip
  ];
}
