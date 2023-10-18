{ config, pkgs, home-manager, nixpkgs-unstable, nixpkgs-develop, ... }:

let
  nix-software-center = import
    (pkgs.fetchFromGitHub {
      owner = "vlinkz";
      repo = "nix-software-center";
      rev = "0.1.2";
      sha256 = "xiqF1mP8wFubdsAQ1BmfjzCgOD3YZf7EGWl9i69FTls=";
    })
    { };
in
{
  imports = [
    ./games.nix
    ./matlab.nix
  ];

  programs.gnupg.agent.enable = true;

  home-manager.users.ymstnt = {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-devedition;
    };

    home.packages = with pkgs; [
      brave
      nixpkgs-unstable.thunderbird-bin
      (nixpkgs-unstable.discord.override { withOpenASAR = true; withVencord = true; })
      nixpkgs-unstable.revolt-desktop
      onlyoffice-bin
      nixpkgs-unstable.obsidian
      nixpkgs-unstable.anytype
      vlc
      syncthing
      evolution
      cryptomator
      gimp
      telegram-desktop
      obs-studio
      openshot-qt
      nixpkgs-unstable.lunatask
      nixpkgs-unstable.p3x-onenote
      wineWowPackages.staging
      winetricks
      nix-software-center
      #hifile

      gnome.gnome-tweaks
      gnome.dconf-editor
      pkgs.gnome-extension-manager
      celluloid
      czkawka
      nixpkgs-unstable.fragments
      nixpkgs-unstable.collision
      nixpkgs-unstable.eyedropper
      nixpkgs-unstable.newsflash
      nixpkgs-unstable.pika-backup
      nixpkgs-unstable.mission-center
      nixpkgs-unstable.rnote
    ];
  };
}
