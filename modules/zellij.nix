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
      nested_session_handling = "descend";
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
        pane._children = [
          {
            bind = {
              _args = [ "q" ];
              _children = [
                {
                  CloseFocus = { };
                }
                {
                  SwitchToMode = {
                    _args = [ "Normal" ];
                  };
                }
              ];
            };
          }
          {
            unbind = {
              _args = [ "x" ];
            };
          }
        ];
        tab._children = [
          {
            bind = {
              _args = [ "q" ];
              _children = [
                {
                  CloseTab = { };
                }
                {
                  SwitchToMode = {
                    _args = [ "Normal" ];
                  };
                }
              ];
            };
          }
          {
            unbind = {
              _args = [ "x" ];
            };
          }
        ];
      };
    };
  };
}
