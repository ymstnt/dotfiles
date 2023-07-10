{ config, pkgs, ... }:
let
    home-manager = builtins.fetchTarball {
        url = "https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz";
        sha256 = "0dfshsgj93ikfkcihf4c5z876h4dwjds998kvgv7sqbfv0z6a4bc";
    };
in
{
    imports = [
        (import "${home-manager}/nixos")
    ];

    home-manager.users.ymstnt = {
        # This should be the same value as `system.stateVersion` in
        # your `configuration.nix` file.
        home.stateVersion = "23.05";
    };
}
