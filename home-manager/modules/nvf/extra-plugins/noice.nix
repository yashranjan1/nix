{
  ui.noice = {
    enable = true;
  
    setupOpts = {
      routes = [
        {
          view = "notify";
          filter = {
            event = "msg_showmode";
          };
        }
      ];
  
      views = {
        cmdline_popup = {
          position = {
            row = 3;
          };
        };
      };
    };
  };
}
