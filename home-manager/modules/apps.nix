{ pkgs, ...}:

{
	home.packages = with pkgs; [
        # apps
		google-chrome
        blueberry
        obs-studio
		nautilus
		discord

        # packages
		gh
        wl-clipboard
        pywal
        grim
        swww
        swappy
        slurp
		lsd
        fastfetch
	];
}
