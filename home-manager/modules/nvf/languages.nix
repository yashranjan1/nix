{ pkgs, ... }: {
  languages = {
    lua = {
      enable = true;
      lsp.lazydev.enable = true;
    };
    nix = {
      enable = true;
      format.enable = true;
    };
    ts = {
      format = {
        enable = true;
        package = pkgs.prettierd;
      };
    };
    go = {
      enable = true;
      format.enable = true;
    };
    python = {
      enable = true;
      lsp.enable = true;
    };
    sql = {
      enable = true;
      format.enable = true;
    };
    markdown = {
      enable = true;
      extensions.markview-nvim.enable = true;
      format.enable = true;
    };
    html = {
      enable = true;
      treesitter = {
        enable = true;
        autotagHtml = true;
      };
    };
    tailwind = { enable = true; };
    enableTreesitter = true;
  };
}
