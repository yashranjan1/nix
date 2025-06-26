{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        # avoid starting multiple hyprlock instances.
        lock_cmd = "pidof hyprlock || hyprlock";
        # lock before suspend.
        before_sleep_cmd = "loginctl lock-session";
        # to avoid having to press a key twice to turn on the display.
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = {
        timeout = 1800;
        on-timeout = "systemctl suspend";
      };
    };
  };
}
