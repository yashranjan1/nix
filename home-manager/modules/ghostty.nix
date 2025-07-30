{
  programs.ghostty = {
    enable = true;
    settings = {
      config-file = "colors";

      window-decoration = "false";
      window-padding-x = 10;
      window-padding-y = 15;
      cursor-style = "block";
      cursor-style-blink = "false";
      shell-integration-features = "no-cursor";

      gtk-tabs-location = "bottom";

      keybind = [ "ctrl+m=new_tab" "ctrl+e=next_tab" "ctrl+i=previous_tab" ];
      background-opacity = 0.8;
    };
  };
}
