{ config, pkgs, ... }: {
  home = {
    username = "yash";
    homeDirectory = "/home/yash";
    stateVersion = "25.05";
  };
  imports = [ ./zsh.nix ./modules/bundle.nix ];
}
