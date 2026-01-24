{ pkgs, ... }:

{
  hm = {
    programs.tofi = {
      enable = true;
      settings = {
        border-width = 0;
        font = "monospace";
        height = "100%";
        num-results = 5;
        outline-width = 0;
        padding-left = "35%";
        padding-top = "35%";
        result-spacing = 25;
        width = "100%";
        background-color = "#000A";
      };
    };

    home.packages = with pkgs; [
      (writeShellScriptBin "tofipowermenu"
        # sh
        ''
          choice=$(printf "Shutdown\nSuspend\nReboot\nLock\nLogout" | tofi --prompt-text "Power menu:")

          case "$choice" in
            Shutdown) exec shutdown 0 ;;
            Suspend)  exec systemctl suspend ;;
            Reboot)   exec systemctl reboot ;;
            Lock)   exec hyprlock & ;;
            Logout)   exec loginctl kill-user "$(whoami)" ;;
          esac
        ''
      )
    ];
  };
}
