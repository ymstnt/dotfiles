{ config, ... }:

{
  hm.programs = {
    zellij = {
      enable = true;
      settings = {
        show_startup_tips = false;
        session_name = "main";
        #attach_to_session = true; Disabled until https://github.com/zellij-org/zellij/issues/5643 is fixed
        mouse_hover_tips = false;
        nested_session_handling = "descend";
        session_serialization = true;
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
    # Workaround for https://github.com/zellij-org/zellij/issues/5643
    zsh.initContent = ''
      [ ! "$ZELLIJ_SESSION_NAME" ] && zellij attach ${config.hm.programs.zellij.settings.session_name}
    '';
  };
}
