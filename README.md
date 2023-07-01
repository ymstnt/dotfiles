# NixOS
- Run these commands before doing anything
```sh
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
sudo nix-channel --add https://channels.nixos.org/nixos-unstable nixos-unstable
sudo nix-channel --update
```
- Extract the boot options from `configuration.nix` and put them into `boot.nix`
- Copy the `.nix` files to `/etc/nixos`
- Set the appropriate driver and configs for your device in `graphics.nix`
- Run `sudo nixos-rebuild switch` to apply the config
- Reboot your device
