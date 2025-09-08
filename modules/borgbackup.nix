{ ... }:

{
  services.borgbackup.repos = {
    backup-vela-ymstnt = {
      path = "/run/media/ymstnt/TNT-PSPRT/backup-vela-ymstnt";
      authorizedKeys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKLQKmZDSyZvpXqaqLigdrQEJzrcu4ry0zGydZipliPZ u0_a293@localhost" # vela
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEVxinYyV/gDhWNeSa0LD6kRKwTWhFxXVS23axGO/2sa ymstnt@andromeda"
      ];
    };
  };
}
