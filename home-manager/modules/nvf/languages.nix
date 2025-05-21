{
  lua = {
    enable = true;
    lsp.lazydev.enable = true;
  };
  nix = {
    enable = true;
    lsp.enable = true;
    format.enable = true;
  };
  ts = {
    enable = true;
    lsp.enable = true;
    format.enable = true;
  };
  go = {
    enable = true;
    lsp.enable = true;
    format.enable = true;
  };
  python.enable = true;
  sql = {
    enable = true;
    format.enable = true;
    lsp.enable = true;
  };
  markdown = {
    enable = true;
    format.enable = true;
    lsp.enable = true;
  };
  html = {
    enable = true;
    treesitter = {
      enable = true;
      autotagHtml = true;
    };
  };
  tailwind = {
    enable = true;
    lsp.enable = true;
  };
  enableLSP = true;
  enableTreesitter = true;
}
