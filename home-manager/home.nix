{ config, pkgs, ...} : {
	home = {
		username = "takina";
		homeDirectory = "/home/takina";
		stateVersion = "24.11";
	};
	imports = [
		./zsh.nix
		./modules/bundle.nix
	];

}
