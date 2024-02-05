{ outputs, pkgs, hm, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

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
    zfxtop
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
    unstable.bitwarden-cli
    unstable.rbw
    unstable.bws
    unstable.gh
    unstable.codeberg-cli
    unstable.glab
    unstable.skate
    unstable.pop
    unstable.glow
    rnix-lsp
    nixpkgs-fmt
    nix-prefetch
  ];
}
