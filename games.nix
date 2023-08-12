{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = config.nixpkgs.config; };
in
{
	users.users.ymstnt.packages = with pkgs; [
		steam
		prismlauncher
		piper
		unstable.collision
	];
}
