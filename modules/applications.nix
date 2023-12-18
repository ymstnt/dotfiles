{ outputs, pkgs, home-manager, ... }:
{
  imports = [
    ./programs/matlab.nix
  ];

  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  programs.gnupg.agent.enable = true;

  home-manager.users.ymstnt = {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-devedition;
    };

    home.packages = with pkgs; [
      brave
      # Electron apps
      (unstable.discord.override { withOpenASAR = true; withVencord = true; })
      unstable.revolt-desktop
      unstable.obsidian
      unstable.anytype
      unstable.lunatask
      unstable.p3x-onenote
      unstable.drawio
      unstable.beeper
      unstable.telegram-desktop
      unstable.spacedrive
      onlyoffice-bin
      thunderbird
      vlc
      syncthing
      evolution
      cryptomator
      gimp
      obs-studio
      openshot-qt
      tenacity
      wineWowPackages.staging
      winetricks
      master.hifile

      gnome.gnome-tweaks
      gnome.dconf-editor
      pkgs.gnome-extension-manager
      celluloid
      czkawka
      unstable.newsflash
      unstable.fragments
      unstable.collision
      unstable.eyedropper
      unstable.pika-backup
      unstable.mission-center
      unstable.rnote
    ];
  };
}
