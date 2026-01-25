{ pkgs, ... }:

{
  services.displayManager.sddm = {
    enable = true;
  };

  programs.seahorse.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables.LIBVA_DRIVER_NAME = "nvidia";
  environment.sessionVariables.__GLX_VENDOR_LIBRARY_NAME = "nvidia";

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
          "ALT, Tab, cyclenext"
          "ALT Shift, Tab, cyclenext, prev"
          ", Print, exec, hyprshot -m region -o $HOME/Pictures/Screenshots"
          "ALT, Print, exec, hyprshot -m window -m active -o $HOME/Pictures/Screenshots"
          "CTRL_L, Print, exec, hyprshot -m output -o $HOME/Pictures/Screenshots"
          "$mod, C, killactive"
          "$mod, F, togglefloating"
          "$mod, M, fullscreen, 1, toggle"
          "$mod, L, exec, hyprlock &"
          "$mod, X, exec, tofipowermenu"
          "$mod, T, exec, kitty"
          "$mod, Return, exec, tofi-drun | xargs uwsm app --"
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
        animation = [
          "windows, 1, 2, default, slide"
          "fade, 1, 2, default"
          "workspaces, 1, 2, default"
        ];
        general = {
          gaps_in = 2;
          gaps_out = 5;
        };
        exec-once = [
          "swaybg"
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
        hyprlauncher
        hyprpwcenter
        hyprsysteminfo
        swaybg
      ];
    };

    gtk = {
      enable = true;

      theme = {
        package = pkgs.flat-remix-gtk;
        name = "Flat-Remix-GTK-Grey-Darkest";
      };

      iconTheme = {
        package = pkgs.adwaita-icon-theme;
        name = "Adwaita";
      };

      font = {
        name = "Inter Regular";
        size = 11;
      };
    };
  };
}
