{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
    bat
    btop
    codeberg-cli
    exercism
    exiftool
    eza
    fastfetch
    gh
    glab
    glow
    gnupg
    hck
    ncdu
    nixpkgs-fmt
    nix-prefetch
    nvtopPackages.full
    p7zip
    pfetch
    pom
    pop
    ripgrep
    scrcpy
    seashells
    skate
    smartmontools
    sof-firmware
    sshfs
    stirling-pdf
    superfile
    termscp
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
