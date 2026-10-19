{ ... }:

{
  hm.programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      show_startup_tips = false;
      session_name = "main";
      attach_to_session = true;
      mouse_hover_tips = false;
      keybinds = {
        shared_except = {
          _args = [ "locked" ];
          _children = [
            {
              bind = {
                _args = [ "Alt g" ];
                _children = [
                  {
                    LaunchPlugin = {
                      _args = [ "filepicker" ];
                    };
                  }
                ];
              };
            }
          ];
        };
      };
    };
  };
}
