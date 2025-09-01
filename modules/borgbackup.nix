{ ... }:

{
  services.borgbackup.repos = {
    backup-vela-ymstnt = {
      path = "/run/media/ymstnt/TNT-PSPRT";
      authorizedKeys = [
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKLQKmZDSyZvpXqaqLigdrQEJzrcu4ry0zGydZipliPZ u0_a293@localhost" # vela
      ];
    };
  };
}
