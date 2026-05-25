{ config, ... }:

{
  sops.templates."controld-dns.conf".content = ''
    [Resolve]
    DNS=${config.sops.placeholder."dns/${config.networking.hostName}"}
  '';

  environment.etc."systemd/resolved.conf.d/controld.conf".source = config.sops.templates."controld-dns.conf".path;

  systemd.services.systemd-resolved.restartTriggers = [
    config.sops.templates."controld-dns.conf".file
  ];

  services.resolved = {
    enable = true;
    dnssec = "true";
    dnsovertls = "true";
  };
}
