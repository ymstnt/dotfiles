{ nixpkgs-master, ... }:

(final: prev: {
	discord = prev.discord.override {
		withOpenASAR = true;
		withVencord = true;
		vencord = nixpkgs-master.legacyPackages.${final.system}.vencord;
	};
})
