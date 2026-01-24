{ ... }:

{
  hm.services.hyprlauncher = {
    enable = false;
    settings = {
      cache = {
        enabled = true;
      };
      finders = {
        desktop_icons = true;
      };
      general = {
        grab_focus = true;
      };
      ui = {
        window_size = "500 300";
      };
    };
  };
}
