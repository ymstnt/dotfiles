{ ... }:

(final: prev: {
	discord = prev.discord.override {
		withOpenASAR = true;
		# withVencord = true; # uncomment once vencord is fixed
	};
})
