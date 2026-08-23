{ pkgs, ... }:

{
  programs.singularity-desktop = {
    enable = true;

    # Optional: you can also exclude bundled applications from the system profile.
    excludePackages = with pkgs; [
      singularity-store
      singularity-music
    ];

    greeter = {
      enable = false; # Enables the singularity greeter (default = false)
      #background = /path/to/image.jpg # You can also customize greetd by replacing the default background image (default = stock wallpaper)
    };
  };

  xdg.portal.enable = true;
}
