# NixOS with Flakes
This is my dotfiles repository for a standard NixOS system with Flakes enabled.
NixOS can be [downloaded here](https://nixos.org/download#nixos-iso)
## Getting started
- Add this into `configuration.nix` and rebuild using `sudo nixos-rebuild switch`
```nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];
```
- Install git temporarily using `nix-shell -p git`
- Clone the repo into `~/dotfiles`

## Configuring hosts
### Existing host
- Copy `/etc/nixos/hardware-configuration.nix` to the appropriate hosts subdirectory
- Edit `configuration.nix` in same directory if needed (e.g. if you need to change boot options)
- Rebuild with `sudo nixos-rebuild switch --flake $HOME/dotfiles/.#hostname --impure` where `hostname` is the existing host's configuration name

### New host
- Make a new subdirectory in `hosts/` and name it however you like
- Create a new file inside called `default.nix`.
  - Edit the file accordingly
  - You can also just copy other hosts' `default.nix` and change the configuration **(recommended)**
- Be sure to import `./hardware-configuartion` in `default.nix`
```nix
{ ... }:
{
imports =
  [
    ./hardware-configuration.nix
  ];
...
}
```
- Copy `/etc/nixos/hardware-configuration.nix` to the new host's subdirectory
- Edit `flake.nix` and find this part:
```nix
...
in
{
  ... = mkSystem ./hosts/...;
  .... = mkSystem ./hosts/....;
};
```
- Add the host there by adding the line `hostname = mkSystem ./hosts/hostname;` where `hostname` is the new host's previously chosen name
- Rebuild with `sudo nixos-rebuild switch --flake $HOME/dotfiles/.#hostname --impure` where `hostname` is the new host's previously chosen name
- Reboot the system
- Be sure to commit your changes

## Changing the default password
- After rebooting, log into your user. The initial password is the same as the username.
- After logging in, `passwd` to **change your user's password**