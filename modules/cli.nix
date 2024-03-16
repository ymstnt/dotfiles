{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
    bat
    bitwarden-cli
    btop
    bws
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
    rbw
    ripgrep
    skate
    smartmontools
    sof-firmware
    sshfs
    unrar
    unzip
    wget
    yt-dlp
    zfxtop
    zip
  ];
}
