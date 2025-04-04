{ ... }:

{
  hm.programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    extraConfig = ''
      return {
        font = wezterm.font("JetBrainsMonoNL Nerd Font"),
        font_size = 12.0,
        enable_wayland = true;
        window_decorations = "TITLE | RESIZE";
        enable_scroll_bar = true;
        hide_tab_bar_if_only_one_tab = true;
      }
    '';
  };
}
