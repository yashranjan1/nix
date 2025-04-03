{ pkgs, ...}:

{
	home.packages = with pkgs; [
        # apps
		google-chrome
		nautilus
		discord

        # packages
		gh
		lsd
        fastfetch
	];
}
