{ pkgs, ... }:

{
  services.xserver = {
    desktopManager.pantheon.enable = true;
  };

  services.pantheon.apps.enable = true;

  environment.pantheon.excludePackages = (with pkgs; [
    midori
  ]) ++ (with pkgs.pantheon; [
    epiphany
    elementary-mail
    elementary-camera
    elementary-music
  ]);

  hm = {
    dconf.settings = {
      "io/elementary/terminal/settings" = {
        audible-bell = false;
        background = "rgb(31,31,31)";
        cursor-color = "rgb(255,255,255)";
        font = "JetBrainsMonoNL Nerd Font 12";
        foreground = "rgb(255,255,255)";
        natural-copy-paste = false;
        palette = "rgb(36,31,49):rgb(192,28,40):rgb(46,194,126):rgb(245,194,17):rgb(30,120,228):rgb(152,65,187):rgb(10,185,220):rgb(192,191,188):rgb(94,92,100):rgb(237,51,59):rgb(87,227,137):rgb(248,228,92):rgb(81,161,255):rgb(192,97,203):rgb(79,210,253):rgb(246,245,244)";
        theme = "custom";
        prefer-dark-style = true;
        unsafe-paste-alert = false;
      };
    };
    home.packages = (with pkgs; [
      #adw-gtk3
      pantheon-tweaks
      dconf-editor
      papers
    ]);
  };
}
