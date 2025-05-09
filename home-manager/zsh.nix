{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = let
      flakeDir = "~/nix";
    in {
      rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}";
      hms = "home-manager switch --flake ${flakeDir}";
      githms = "git add . && home-manager switch --flake ${flakeDir}";
      tmux = "tmux -u";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    initExtra = ''
      source ~/.p10k.zsh
    '';

    oh-my-zsh = {
      enable = true;
    };
  };
}
