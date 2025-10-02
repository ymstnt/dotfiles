{ pkgs, ... }:
{
  # Enable CUPS to print documents and SANE for scanning.
  services = {
    printing = {
      enable = true;
      drivers = with pkgs; [
        cups-filters
        cups-browsed
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
  hardware = {
    sane = {
      enable = true;
      extraBackends = [ pkgs.sane-airscan ];
    };
  };
}
