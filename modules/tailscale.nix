{ ... }:

{
  services.tailscale = {
    enable = true;
  };

  services.resolved.enable = true;

  networking.interfaces.tailscale0.useDHCP = false;
}
