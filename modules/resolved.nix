{ config, ... }:

{
  sops.secrets."dns/${config.networking.hostName}" = {
    path = "/etc/systemd/resolved.conf.d/controld.conf";
    owner = "systemd-resolve" ;
    group = "systemd-resolve" ;
    restartUnits = [ "systemd-resolved.service" ];
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "allow-downgrade";
      DNSOverTLS = "true";
    };
  };
}
