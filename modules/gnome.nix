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
    epiphany
    gnome-connections
    gnome-tour
    snapshot
  ]) ++ (with pkgs.gnome; [
    geary
    gnome-maps
    gnome-music
    totem
    yelp
  ]);

  hm = {
    dconf.settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;

        enabled-extensions = [
          "app-hider@lynith.dev"
          "caffeine@patapon.info"
          "just-perfection-desktop@just-perfection"
          "quick-touchpad-toggle@kramo.hu"
          "trayIconsReloaded@selfmade.pl"
          "Vitals@CoreCoding.com"
        ];

        favorite-apps = [
          "vivaldi-stable.desktop"
          "thunderbird.desktop"
          "discord.desktop"
          "element-desktop.desktop"
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
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:close";
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
      dconf-editor
      gnome-tweaks
    ]) ++ (with pkgs.gnomeExtensions; [
      alttab-scroll-workaround
      app-hider
      caffeine
      just-perfection
      quick-touchpad-toggle
      tray-icons-reloaded
      vitals
    ]);
  };
}

