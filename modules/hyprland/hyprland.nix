{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
  };

  programs.seahorse.enable = true;

  services.udisks2.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  hm = {
    wayland.windowManager.hyprland = {
      enable = true;
      systemd.enable = false;
      settings = {
        "$mod" = "SUPER";
        binds."drag_threshold" = 10;
        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizeactive"
        ];
        bind = [
          # Workspace keybinds
          "ALT, Tab, cyclenext"
          "ALT Shift, Tab, cyclenext, prev"
          "$mod, right, workspace, r+1"
          "$mod, left, workspace, r-1"
          "$mod SHIFT, right, movetoworkspace, r+1"
          "$mod SHIFT, left, movetoworkspace, r-1"
          # Print screen keybind
          ", Print, exec, hyprshot -m region -z -o $HOME/Pictures/Screenshots"
          "ALT, Print, exec, hyprshot -m window -m active -z -o $HOME/Pictures/Screenshots"
          "CTRL_L, Print, exec, hyprshot -m output -z -o $HOME/Pictures/Screenshots"
          # App launching
          "$mod, L, exec, hyprlock &"
          "$mod, X, exec, tofipowermenu"
          "$mod, T, exec, kitty"
          "$mod, Return, exec, tofi-drun | xargs uwsm app --"
          # Misc keybinds
          "$mod, Q, killactive"
          "$mod, F, togglefloating"
          "$mod, M, fullscreen, 1, toggle"
          # Discord keybinds (passthrough)
          ", mouse:202, pass, class:^(discord)$"
          ", mouse:276, pass, class:^(discord)$"
          "L_CTRL L_SHIFT, code:21, pass, class:^(discord)$"
        ]
        ++ (builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        ));
        gesture = [
          "3, horizontal, workspace"
        ];
        input = {
          kb_layout = "hu";
          touchpad = {
            clickfinger_behavior = false;
            tap-to-click = true;
          };
        };
        monitor = [
          "DP-3, 2560x1080@75, 1280x0, 1"
          "HDMI-A-1, 1920x1080, 1600x1080, 1"
        ];
        workspace = [
          "1, monitor:DP-3, default:true, persistent:true"
          "2, monitor:DP-3, persistent:true"
          "3, monitor:DP-3, persistent:true"
          "4, monitor:DP-3, persistent:true"
          "5, monitor:DP-3, persistent:true"
          "6, monitor:HDMI-A-1, default:true, persistent:true"
          "7, monitor:HDMI-A-1, persistent:true"
          "8, monitor:HDMI-A-1, persistent:true"
          "9, monitor:HDMI-A-1, persistent:true"
        ];
        animation = [
          "windows, 1, 2, default, slide"
          "fade, 1, 2, default"
          "workspaces, 1, 2, default"
        ];
        general = {
          gaps_in = 2;
          gaps_out = 5;
        };
        windowrule = [
          "match:initial_title ^Cryptomator$, float on"
          "match:title .*heylogin.*, sync_fullscreen off"
        ];
        exec-once = [
          "swaybg -i $HOME/Pictures/Wallpapers/paul-volkmer-qVotvbsuM_c-unsplash.jpg -m fill"
          "udiskie"
        ];
      };
    };

    home = {
      pointerCursor = {
        gtk.enable = true;
        # x11.enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 14;
      };

      packages = with pkgs; [
        hyprpwcenter
        hyprshutdown
        hyprsysteminfo
        nautilus
        swaybg
        udiskie
        wayland-logout
      ];
    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
    };

    gtk = {
      enable = true;
      theme = {
        package = pkgs.adw-gtk3;
        name = "adw-gtk3-dark";
      };
      iconTheme = {
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
      };
      font = {
        name = "Inter Regular";
        size = 11;
      };
      gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
    };
  };
}
