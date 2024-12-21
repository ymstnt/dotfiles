{ ... }:

{
  networking = {
    networkmanager.enable = true;
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.g
    firewall = {
      enable = true;
      allowedTCPPorts = [ 25565 8384 ];
      allowedUDPPorts = [ 25565 8384 24642 ];
      allowedTCPPortRanges = [
        { from = 27005; to = 27015; }
      ];
      allowedUDPPortRanges = [
        { from = 27005; to = 27015; }
      ];
    };
  };
  systemd.services.NetworkManager-wait-online.enable = false;
}
