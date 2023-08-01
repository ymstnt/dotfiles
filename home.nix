{ config, pkgs, ... }:

{
	home-manager.users.ymstnt = {
	    # This should be the same value as `system.stateVersion` in
	    # your `configuration.nix` file.
	    home.stateVersion = "23.05";

	    programs.zsh = {
          enable = true;
          shellAliases = {
            ll = "ls -l";
            update = "sudo nixos-rebuild switch";
          };
          enableAutosuggestions = true;
          enableSyntaxHighlighting = true;
          initExtra = ''
            .  ~/.zshrc_old
          '';
       };
	};

	
}
