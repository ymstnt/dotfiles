{ ... }:

{
  hm.programs.ashell = {
    enable = false;
    systemd.enable = true;
    settings = {
      modules = {
        center = [
          "Clock"
        ];
        left = [
          "AppLauncher"
          "Workspaces"
          "WindowTitle"
        ];
        right = [
          "SystemInfo"
          [
            "Tray"
            "Privacy"
            "Settings"
          ]
        ];
      };
      app_launcher_cmd = "tofi-drun | xargs uwsm app --";
      workspaces = {
        visibility_mode = "MonitorSpecific";
      };
      window_title = {
        truncate_title_after_length = 100;
      };
      clock = {
        format = "%a, %b %d. %R";
      };
      settings = {
        lock_cmd = "hyprlock &";
        logout_cmd = "wayland-logout";
      };
    };
  };
}
