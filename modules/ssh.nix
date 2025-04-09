{ ... }:

{
  services.openssh = {
    enable = true;
  };

  hm.services.ssh-agent = {
    enable = true;
  };
}
