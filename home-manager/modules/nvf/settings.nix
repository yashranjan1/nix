{ pkgs, lib, ... }: {
  # alias stuff
  vimAlias = true;
  viAlias = true;
  lsp.enable = true;

  clipboard = {
    enable = true;
    providers.wl-copy.enable = true;
  };

  # undo
  undoFile.enable = true;

  # global opts
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  lazy = { plugins = { telescope.event = "VimEnter"; }; };

  treesitter = {
    mappings.incrementalSelection = {
      decrementByNode = null;
      incrementByNode = null;
      incrementByScope = null;
      init = null;
    };
  };

  extraPackages = with pkgs; [
    stylua
    vue-language-server
    sqlfluff
    vtsls
    vscode-langservers-extracted
    wl-clipboard
    nixfmt-classic
    marksman
    sqls
    nixd
    tailwindcss-language-server
    isort
    black
    basedpyright
  ];
  # FIX: Remove after this is fixed: https://github.com/NotAShelf/nvf/issues/920#issuecomment-2974522465
  luaConfigRC.sqlconfig = # lua
    ''
      require("lspconfig").sqls.setup({
        on_attach = function(client, bufnr)
          require('sqls').on_attach(client, bufnr) 
        end,
        cmd = { "${pkgs.sqls}/bin/sqls", "-config", string.format("%s/config.yml", vim.fn.getcwd()) }
      })
    '';
}
