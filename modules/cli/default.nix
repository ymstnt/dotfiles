{ pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./starship.nix
    ./git.nix
    ./micro.nix
    ./helix.nix
    ./zoxide.nix
    ./frack.nix
  ];

  hm.home.packages = with pkgs; [
    wget
    pfetch
    fastfetch
    zfxtop
    btop
    gnupg
    zip
    unzip
    unrar
    p7zip
    eza
    bat
    ripgrep
    hck
    sof-firmware
    sshfs
    smartmontools
    exiftool
    yt-dlp
    bitwarden-cli
    rbw
    bws
    gh
    codeberg-cli
    glab
    skate
    pop
    glow
    nixpkgs-fmt
    nix-prefetch
  ];
}
