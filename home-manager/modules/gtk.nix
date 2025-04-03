{ pkgs, ... }: {
  home.packages = with pkgs; [ papirus-icon-theme ];

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
  };
}
