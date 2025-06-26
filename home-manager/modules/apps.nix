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
    gimp3

    # packages
    gh
    libnotify
    devenv
    awscli2
    bluez
    hyprpicker
    dart-sass
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
