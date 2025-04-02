{ pkgs, ...}:

{
	home.packages = with pkgs; [
		google-chrome
		gh
		lsd
		nautilus
		discord
	];
}
