{
  keymaps = [
    {
      key = "<left>"; 
      mode = "n"; 
      action = "<cmd><CR>";
      silent = true;
    }
    {
      key = "<right>";
      mode = "n"; 
      action = "<cmd><CR>";
      silent = true;
    }
    {
      key = "<up>";
      mode = "n"; 
      action = "<cmd><CR>";
      silent = true;
    }
    {
      key = "<down>"; 
      mode = "n"; 
      action = "<cmd><CR>";
      silent = true;
    }
    {
      key = "<leader>f";
      action = ''<cmd>lua require("conform").format({ async = true, lsp_format = "fallback" })<CR>'';
      mode = "n";
      desc = "[F]ormat buffer";
    }
    {
      key = "<leader>o";
      action = ''<cmd>Oil<CR>'';
      mode = "n";
      desc = "Opens [O]il.nvim window";
    }
    {
      key = "<leader>y";
      action = ''"+y'';
      mode = "n";
      desc = "[Y]ank to system clipboard";
    }
    {
      key = "<leader>p";
      action = ''"+p'';
      mode = "n";
      desc = "[P]aste from system clipboard";
    }
  ];
}
