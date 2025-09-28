{pkgs, config,...}: {
	boot.plymouth = {
		enable = true;
		themePackages = [ pkgs.adi1090x-plymouth-themes ];
		/* 
		Good themes:
		- abstract_ring 1
		- abstract_ring_alt 2
		- dragon 28
		- dark_planet 23
		- glitch 30
		*/
		theme = "abstract_ring_alt"; # https://github.com/adi1090x/plymouth-themes/blob/master/pack_1/abstract_ring/
	};
}
