{
  programs.hyprlock = {
    enable = true;
    settings = {
      source =
        [ "~/.cache/wal/colors-hyprland.conf" "~/.config/hypr/options.conf" ];
      background = {
        monitor = "";
        path = "$wp";
        blur_passes = 2;
        contrast = 1;
        brightness = 0.5;
        vibrancy = 0.2;
        vibrancy_darkness = 0.2;
      };

      # GENERAL
      general = {
        no_fade_in = true;
        no_fade_out = true;
        hide_cursor = false;
        grace = 0;
        disable_loading_bar = true;
      };

      # INPUT FIELD
      input-field = {
        monitor = "";
        size = [ 250 60 ];
        outline_thickness = 2;
        dots_size = 0.2;
        dots_spacing = 0.35;
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.2)";
        font_color = "$foreground";
        fade_on_empty = false;
        rounding = -1;
        check_color = "rgb(204, 136, 34)";
        placeholder_text =
          ''<span foreground="##ffffff">Input Password...</span>'';
        hide_input = false;
        position = "0, -200";
        halign = "center";
        valign = "center";
      };

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%A, %B %d")"'';
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 22;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%-I:%M")"'';
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 95;
          font_family = "JetBrains Mono Extrabold";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "";
          text =
            ''cmd[update:1000] echo "$(~/.config/scripts/getCurrMusic.sh)"'';
          color = "$foreground";
          font_size = 18;
          font_family = "JetBrains Mono";
          position = "0, 50";
          halign = "center";
          valign = "bottom";
        }
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(whoami)"'';
          color = "$foreground";
          font_size = 14;
          font_family = "JetBrains Mono";
          position = "0, -100";
          halign = "center";
          valign = "center";
        }
      ];

      image = {
        monitor = "";
        path = "~/.local/share/ags-editable/profile.jpg";
        size = 128;
        border_size = 2;
        border_color = "$foreground";
        rounding = -1;
        position = "0, -15";
        halign = "center";
        valign = "center";
      };
    };
  };
}
