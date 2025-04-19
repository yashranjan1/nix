{
  pkgs,
  unstable,
  ...
}: let
  bootdev = pkgs.callPackage ./bootdev.nix {};
in {
  home.packages = with pkgs; [
    # apps
    google-chrome
    blueberry
    obs-studio
    nautilus
    discord

    # packages
    gh
    go
    wl-clipboard
    gopls
    jetbrains-mono
    unstable.nerd-fonts.jetbrains-mono
    bootdev
    pnpm
    nodejs_23
    fcitx5
    pywal
    grim
    swww
    swappy
    slurp
    lsd
    fastfetch
  ];
}
