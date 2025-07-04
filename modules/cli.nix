{ pkgs, ... }:

{
  hm.home.packages = with pkgs; [
    bat
    btop
    codeberg-cli
    coreutils
    exercism
    exiftool
    eza
    fastfetch
    ffmpegthumbnailer
    filen-cli
    gh
    glab
    glow
    gnupg
    hck
    jq
    msedit
    ncdu
    nixpkgs-fmt
    nix-prefetch
    nvtopPackages.full
    p7zip
    pfetch
    pom
    pop
    progress
    rclone
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
