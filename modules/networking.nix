{ ... }:

{
  networking = {
    networkmanager.enable = true;
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.g
    firewall = {
      enable = true;
      # 12315 required for grayjay
      allowedTCPPorts = [ 25565 8384 12315 ];
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
