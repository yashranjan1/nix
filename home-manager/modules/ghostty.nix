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

      background-opacity = 0.8;
    };
  };
}
