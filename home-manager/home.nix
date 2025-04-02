{ config, pkgs, ...} : {
	home = {
		username = "yash";
		homeDirectory = "/home/yash";
		stateVersion = "24.11";
	};
	imports = [
		./zsh.nix
		./modules/bundle.nix
	];

}
