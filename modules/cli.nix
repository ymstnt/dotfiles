{ outputs, pkgs, hm, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  hm.home.packages = with pkgs; [
    wget
    pfetch
    starship
    adw-gtk3
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
