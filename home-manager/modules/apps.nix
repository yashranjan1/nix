{ pkgs, unstable, ... }:
let bootdev = pkgs.callPackage ./bootdev.nix { };
in {
  home.packages = with pkgs; [
    # apps
    google-chrome
    blueberry
    obs-studio
    nautilus
    vlc
    discord
    gimp3
    postman
    unstable.ollama-rocm

    # packages
    gh
    libnotify
    # WARN: Remove this after devenv is stable on the stable branch
    unstable.devenv
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
    nodejs_24
    bootdev
    pywal
    grim
    swww
    swappy
    slurp
    lsd
    fastfetch
    pnpm
  ];
}
