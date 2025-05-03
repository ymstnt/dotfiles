{ ... }:

{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      X11Forwarding = true;
    };
  };

  users.users.ymstnt.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJLWg7uXAd3GfBmXV5b9iLp+EZ9rfu+gRWWCb8YXML4o u0_a557@localhost" # orion
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDVor+g/31/XFIzuZYQrNK/RIbU1iDaSyOfM8re73eAd ymstnt@cassiopeia"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGx6TyqDxyb74F0rjyCu/9z4QO2pX6tmJdb3m62QrQrg ymstnt@cassiopeia-win"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEVxinYyV/gDhWNeSa0LD6kRKwTWhFxXVS23axGO/2sa ymstnt@andromeda"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKV37wsI1w67r267Tq1J4qGlym2eTdcOBs6jtlUpu3UJ ymstnt@andromeda-win"
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKLQKmZDSyZvpXqaqLigdrQEJzrcu4ry0zGydZipliPZ u0_a293@localhost" # vela
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICRh9g9ZttYswCxdIE7KYL3xs4JZqhDCUc5BYjDMxFph u0_a355@localhost" # antlia
  ];

  hm.programs.ssh = {
    enable = true;
    matchBlocks."*".extraOptions.StrictHostKeyChecking = "no";
  };

  hm.services.ssh-agent = {
    enable = true;
  };
}
