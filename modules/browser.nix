{ pkgs, ... }:

{
  hm = {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox-devedition;
      # nativeMessagingHosts.packages = pkgs.gnome-browser-connector;
    };

    home.packages = with pkgs; [
      brave
    ];
  };
}
