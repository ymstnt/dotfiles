{ pkgs, ... }:

(final: prev: {
	discord = prev.discord.override {
		withOpenASAR = true;
		withEquicord = true;
		equicord = pkgs.nur.repos.ymstnt.equicord;
	};
})
