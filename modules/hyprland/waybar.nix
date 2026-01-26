{ ... }:

{
  hm.programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [
          "hyprland/workspaces"
          "hyprland/window"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "group/status"
          "group/settings"
        ];

        "hyprland/window" = {
          max-length = 50;
        };

        "clock" = {
          format = "{:L%a, %b. %d. %H:%M}";
          locale = "hu_HU.utf8";
          tooltip = false;
        };

        "group/status" = {
          orientation = "horizontal";
          modules = [
            "cpu"
            "memory"
          ];
        };

        "cpu" = {
          format = " {usage}%";
        };

        "memory" = {
          format = " {percentage}%";
        };

        "group/settings" = {
          orientation = "horizontal";
          modules = [
            "tray"
            "privacy"
            "wireplumber"
            "custom/power"
          ];
        };

        "tray" = {
          icon-size = 15;
          spacing = 10;
        };

        "wireplumber" = {
          format = "{icon} {volume}%";
          format-muted = "󰝟";
          on-click-right = "pavucontrol";
          format-icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
        };

        "custom/power" = {
          format = "⏻";
          tooltip = "Power menu";
          on-click = "tofipowermenu";
        };
      };
    };
    style = ''
      * {
        border: none;
        border-radius: 0;
        font-family: "RobotoMono Nerd Font Propo, Light", monospace;
        font-size: 14px;
        min-height: 0;
      }

      window#waybar {
        background: rgba(0, 0, 0, 0.5);
        color: #ffffff;
      }

      #workspaces button {
        padding: 0 10px;
        background: transparent;
        color: #ffffff;
        border-bottom: 2px solid transparent;
      }

      #workspaces button.empty {
        color: #999999;
      }

      #workspaces button.visible {
        color: #ffffff;
      }

      #workspaces button.active {
        background-color: rgba(255, 255, 255, 0.2);
        border-bottom: 2px solid #ffffff;
      }

      #status, #settings {
        padding: 0 10px;
      }

      #window,
      #backlight,
      #wireplumber,
      #mpd,
      #cpu,
      #memory,
      #battery,
      #clock,
      #tray,
      #custom-power {
        padding: 0 10px;
      }
    '';
  };
}
