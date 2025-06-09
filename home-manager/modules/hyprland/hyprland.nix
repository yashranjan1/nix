{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "DP-2,2560x1440@165,0x0,1.25"
        "DP-1,1920x1080@239.76,2048x36,1"
      ];

      "$terminal" = "ghostty";
      "$fileManager" = "nautilus";
      "$menu" = "wofi --show drun";

      exec-once = [
        "swww-daemon"
        "fcitx5 -d"
        "ags run"
        "hypridle"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];

      "source" = "~/.cache/wal/colors-hyprland.conf";

      general = {
        gaps_in = 5;
        gaps_out = "0,20,20,20";

        border_size = 2;

        "col.inactive_border" = "0x00000000";
        "col.active_border" = "$color1 $color5 45deg";

        resize_on_border = false;

        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = {
        rounding = 10;

        active_opacity = 1.0;
        inactive_opacity = 0.85;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "0x1a1a1aee";
        };

        blur = {
          ignore_opacity = true;

          enabled = true;
          size = 5;
          passes = 3;

          vibrancy = 0.5;
        };
      };

      layerrule = [
        "blur, gtk-layer-shell"
        "ignorealpha 0.6, gtk-layer-shell"
      ];

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
        focus_on_activate = true;
      };

      input = {
        kb_layout = "us";

        follow_mouse = 1;

        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };
      };

      gestures = {
        workspace_swipe = false;
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      # source = binds.conf

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "center(0), initialClass:Code"
      ];
    };
  };
}
