{ home-manager, ... }:

{
  # NOTE: MANUAL INSTALL REQUIRED FOR MATLAB:
  # prepare some folders: $ mkdir -p ~/.local/share/matlab ~/.local/bin
  # log in and download the linux installer zip from https://www.mathworks.com/downloads/web_downloads
  # extract and cd into it
  # go into a shell for matlab: $ nix run gitlab:doronbehar/nix-matlab#matlab-shell
  # (from the shell) start the GUI installer: $ ./install
  # (in the gui installer) install matlab to ~/.local/share/matlab/install
  # remove broken installer generated and modified files: $ rm ~/.local/share/applications/mimeapps.list ~/.local/share/applications/mw-*.desktop
  # rebuild your system to regenerate mimeapps.list and link files with home manager
  # download the matlab launcher script: $ git clone https://gitlab.com/doronbehar/nix-matlab ~/.local/share/matlab/launch
  home-manager.users.ymstnt.home.file = {
    ".config/matlab/nix.sh".source = ../../home/.config/matlab/nix.sh;
    ".local/share/applications/matlab.desktop".source = ../../home/.local/share/applications/matlab.desktop;
  };
}
