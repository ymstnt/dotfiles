{ config, pkgs, ... }:

{
	home-manager.users.ymstnt = {
	    # This should be the same value as `system.stateVersion` in
	    # your `configuration.nix` file.
	    home.stateVersion = "23.05";

	    programs.zsh = {
          enable = true;

          history = {
            path = "$HOME/.zsh_history";
          	size = 9999999;
          	extended = true;
          	expireDuplicatesFirst = true;
          	ignoreDups = true;
          	#ignoreAllDups = true;
          	ignoreSpace = true;
          	share = true;
          };
          
          shellAliases = {
            ll = "ls -l";
            update = "sudo nixos-rebuild switch";
            nixconfig = "sudo micro /etc/nixos/configuration.nix";
            homeconfig = "sudo micro /etc/nixos/home.nix";
            zshreload = "source ~/.zshrc";
            lf = "ls -la | grep";
            ff = "find | grep";
            hisf = "history | grep";
            rmf = "sudo rm -rf";
            mexec = "sudoc chmod a+x";
            cls = "clear";
            bm = "bashmount";
          };
          
          shellGlobalAliases = {
          	ls = "exa --color=always --group-directories-first --icons"; # Fancier ls with icons
          	cat = "bat --style snip --style changes --style header"; # Fancier cat with better previews. Press q to quit
          	grep = "rg -i --color=auto"; # Faster grep
          	lls = "ls";
          };
          
          enableAutosuggestions = true;
          enableSyntaxHighlighting = true;

          initExtra = ''
            .  ~/.zshrc_old
          '';
       };
	};

	programs.starship = {
		enable = true;
		settings = {
			format = "[](\#003F5E)\$os\$username\[](bg:\#005077 fg:\#003F5E)\$directory\[](bg:\#006496 fg:\#005077)\$git_branch\$git_status\[ ](fg:\#006496)";

			username = {
			  show_always = true;
			  style_user = "bg:\#003F5E";
			  style_root = "bg:\#003F5E";
			  format = "[$user ]($style)";
			  disabled = false;
			};

			os = {
			  format = "[ ]($style)";
			  style = "bg:\#003F5E";
			  disabled = false;
			};

			directory = {
			  style = "bg:\#005077";
			  format = "[ $path ]($style)";
			  truncation_length = 3;
			  truncation_symbol = "…/";
			};

			directory.substitutions = {
			  "Documents" = " ";
			  "Downloads" = " ";
			  "Music" = " ";
			  "Pictures" = " ";
			};

			git_branch = {
			  symbol = "";
			  style = "bg:\#006496";
			  format = "[ $symbol $branch ]($style)";
			};

			git_status = {
			  style = "bg:\#006496";
			  format = "[$all_status$ahead_behind ]($style)";
			};
		};
	};
}
