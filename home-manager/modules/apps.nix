{ pkgs, unstable, ... }:
let bootdev = pkgs.callPackage ./bootdev.nix { };
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
    libnotify
    devenv
    gimp
    awscli2
    bluez
    hyprpicker
    dart-sass
    go
    wl-clipboard
    sqlfluff
    gopls
    jetbrains-mono
    playerctl
    unstable.nerd-fonts.jetbrains-mono
    bootdev
    pywal
    grim
    swww
    swappy
    slurp
    lsd
    fastfetch
  ];
}
