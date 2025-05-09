{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "~/.config/fastfetch/nix-logo.png";
      };
      display = {
        separator = ": ";
      };

      modules = [
        "break"
        "title"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "wm"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "disk"
        "locale"
        "break"
        "break"
        "colors"
      ];
    };
  };

  home.file.".config/fastfetch/nix-logo.png".source = ../../defaults/assets/nix_logo.png;
}
