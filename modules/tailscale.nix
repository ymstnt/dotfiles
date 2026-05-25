{ ... }:

{
  services.tailscale = {
    enable = true;
  };

  networking.interfaces.tailscale0.useDHCP = false;
}
