{
  wayland.windowManager.hyprland.settings = {
    "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier
    "$scripts" = "/home/yash/.config/scripts";

    bind = [
      "$mainMod, T, exec, $terminal"
      "$mainMod, Q, killactive,"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, V, togglefloating,"
      "$mainMod SHIFT, S, exec, grim -g '$(slurp -w 0)' - | swappy -f - -o $(xdg-user-dir PICTURES)/Screenshots/$(date +'%s.png')"
      "$mainMod, SPACE, exec, source $scripts/toggle_window.sh app-launcher"
      "$mainMod, P, pseudo, # dwindle"
      "$mainMod, G, togglesplit, # dwindle"
      "$mainMod, Z, exec, hyprlock"

      "$mainMod, R, exec, source $scripts/reload_ags.sh"
      "$mainMod, C, exec, source $scripts/toggle_window.sh none"

      # Move focus with mainMod + arrow keys
      "$mainMod, h, movefocus, l"
      "$mainMod, l, movefocus, r"
      "$mainMod, k, movefocus, u"
      "$mainMod, j, movefocus, d"

      # swap windows around
      "$mainMod SHIFT, h, movewindow, l"
      "$mainMod SHIFT, l, movewindow, r"
      "$mainMod SHIFT, k, movewindow, u"
      "$mainMod SHIFT, j, movewindow, d"

      # Switch workspaces with mainMod + [0-9]
      "$mainMod, 1, workspace, 1"
      "$mainMod, 2, workspace, 2"
      "$mainMod, 3, workspace, 3"
      "$mainMod, 4, workspace, 4"
      "$mainMod, 5, workspace, 5"
      "$mainMod, 6, workspace, 6"
      "$mainMod, 7, workspace, 7"
      "$mainMod, 8, workspace, 8"
      "$mainMod, 9, workspace, 9"
      "$mainMod, 0, workspace, 10"

      # Volume
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

      # Move active window to a workspace with mainMod + SHIFT + [0-9]
      "$mainMod SHIFT, 1, movetoworkspace, 1"
      "$mainMod SHIFT, 2, movetoworkspace, 2"
      "$mainMod SHIFT, 3, movetoworkspace, 3"
      "$mainMod SHIFT, 4, movetoworkspace, 4"
      "$mainMod SHIFT, 5, movetoworkspace, 5"
      "$mainMod SHIFT, 6, movetoworkspace, 6"
      "$mainMod SHIFT, 7, movetoworkspace, 7"
      "$mainMod SHIFT, 8, movetoworkspace, 8"
      "$mainMod SHIFT, 9, movetoworkspace, 9"
      "$mainMod SHIFT, 0, movetoworkspace, 10"

      # Example special workspace (scratchpad)
      # bind = $mainMod, S, togglespecialworkspace, magic
      # bind = $mainMod SHIFT, S, movetoworkspace, special:magic

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];

    bindl = [
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioNext, exec, playerctl next"
    ];

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];
  };
}
