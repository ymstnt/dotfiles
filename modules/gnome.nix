{ pkgs, ... }:

{
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;    
  };

  # GNOME extension support
  services.gnome.gnome-browser-connector.enable = true;

  # GNOME debloat
  environment.gnome.excludePackages = (with pkgs; [
    gnome-connections
    gnome-tour
    snapshot
    epiphany
  ]) ++ (with pkgs.gnome; [
    totem
    yelp
    geary
    gnome-maps
    gnome-music
  ]);

  hm = {
    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;

        enabled-extensions = [
          "just-perfection-desktop@just-perfection"
          "caffeine@patapon.info"
          "Vitals@CoreCoding.com"
          "app-hider@lynith.dev"
          "quick-touchpad-toggle@kramo.hu"
          "trayIconsReloaded@selfmade.pl"
        ];

        favorite-apps = [
          "vivaldi-stable.desktop"
          "thunderbird.desktop"
          "discord.desktop"
          "beeper.desktop"
          "org.gnome.Console.desktop"
          "HiFile.desktop"
          "org.gnome.Nautilus.desktop"
        ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "adw-gtk3-dark";
      };
    };

    gtk = {
      enable = true;
      gtk3 = {
        bookmarks = [
          "file:///home/ymstnt/Documents"
          "file:///home/ymstnt/Downloads"
          "file:///home/ymstnt/Pictures"
          "file:///home/ymstnt/Videos"
          "file:///home/ymstnt/Music"
          "file:///home/ymstnt/Documents/PROJEKTEK"
          "file:///home/ymstnt/Documents/Egyetem"
          #"file:///home/ymstnt/Documents/Iskola"
          "file:///home/ymstnt/Documents/Munka"
          "file:///home/ymstnt/dotfiles dotfiles"
          "file:///etc/nixos nixos"
          "file:///home/ymstnt/.local/share .local"
          "file:///home/ymstnt/.config .config"
          "sftp://ymstnt@ymstnt.com:42727/home/ymstnt/Files Shared Drive"
          "sftp://ymstnt@ymstnt.com:42727/var/media/ Media Files"
        ];

        extraConfig = {
          gtk-application-prefer-dark-theme = 1;
        };
      };
      gtk4 = {
        extraConfig = {
          gtk-hint-font-metrics = true;
          gtk-application-prefer-dark-theme = 1;
        };
      };
    };

    qt = {
      enable = true;
      platformTheme.name = "gtk";
      style.name = "adwaita-dark";
    };

    home.packages = (with pkgs; [
      adwaita-qt
      adw-gtk3
      gnome-extension-manager
    ]) ++ (with pkgs.gnome; [
      gnome-tweaks
      dconf-editor
    ]) ++ (with pkgs.gnomeExtensions; [
      just-perfection
      caffeine
      vitals
      tray-icons-reloaded
      app-hider
      quick-touchpad-toggle
      alttab-scroll-workaround
    ]);
  };
}

