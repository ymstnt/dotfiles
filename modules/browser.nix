{ outputs, pkgs, home-manager, ... }:

{
  nixpkgs.overlays = [ outputs.overlays.unstable-packages ];

  home-manager.users.ymstnt = {
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
