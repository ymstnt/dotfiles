{ inputs, outputs, config, pkgs, home-manager, ... }:
{
  imports = [
    ./games.nix
    ./programs/matlab.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];

    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  programs.gnupg.agent.enable = true;

  home-manager.users.ymstnt = {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-devedition;
    };

    home.packages = with pkgs; [
      brave
      unstable.thunderbird-bin
      (unstable.discord.override { withOpenASAR = true; withVencord = true; })
      unstable.revolt-desktop
      onlyoffice-bin
      unstable.obsidian
      unstable.anytype
      vlc
      syncthing
      evolution
      cryptomator
      gimp
      telegram-desktop
      obs-studio
      openshot-qt
      unstable.lunatask
      unstable.p3x-onenote
      wineWowPackages.staging
      winetricks
      nix-software-center
      unstable.hifile

      gnome.gnome-tweaks
      gnome.dconf-editor
      pkgs.gnome-extension-manager
      celluloid
      czkawka
      unstable.fragments
      unstable.collision
      unstable.eyedropper
      unstable.newsflash
      unstable.pika-backup
      unstable.mission-center
      unstable.rnote
    ];
  };
}
