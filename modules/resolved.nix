{ config, ... }:

{
  sops.templates."controld-dns.conf" = {
    content = ''
      [Resolve]
      DNS=${config.sops.placeholder."dns/${config.networking.hostName}"}
    '';
    owner = "systemd-resolve";
    group = "systemd-resolve";
    restartUnits = [ "systemd-resolved.service" ];
  };

  systemd.tmpfiles.rules = [
    "d /run/systemd/resolved.conf.d 0755 root root -"
    "L+ /run/systemd/resolved.conf.d/controld.conf - - - - ${config.sops.templates."controld-dns.conf".path}"
  ];

  systemd.services.systemd-resolved.restartTriggers = [
    config.sops.templates."controld-dns.conf".file
  ];

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "true";
      DNSOverTLS = "true";
    };
  };
}
