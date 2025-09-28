{ pkgs, ... }: {
  # alias stuff
  vimAlias = true;
  viAlias = true;
  lsp.enable = true;

  mini.statusline = { enable = true; };

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
    haskell-language-server
    ormolu
    vscode-langservers-extracted
    wl-clipboard
    nixfmt-classic
    marksman
    sqls
    nixd
    tailwindcss-language-server
    isort
    phpactor
    black
    basedpyright
    vimPlugins.friendly-snippets
    ripgrep
  ];

  luaConfigRC.sqlconfig = # lua
    ''
        -- FIX: Remove after this is fixed: https://github.com/NotAShelf/nvf/issues/920#issuecomment-2974522465
           require("lspconfig").sqls.setup({
             on_attach = function(client, bufnr)
               require('sqls').on_attach(client, bufnr) 
             end,
             cmd = { "${pkgs.sqls}/bin/sqls", "-config", string.format("%s/config.yml", vim.fn.getcwd()) }
           })

        -- attaching local language server
           local client = vim.lsp.start_client {
               cmd = {"/home/yash/github.com/yashranjan1/ejs-language-tools/build/ejs-language-server"},
               name = "ejs-language-tools",
               on_attach = default_on_attach,
           }
           if not client then
               vim.notify("Client didnt load")
               return
           end
           vim.api.nvim_create_autocmd("FileType", {
               pattern = "ejs",
               callback = function()
                   vim.lsp.buf_attach_client(0, client)
               end,
           })

        -- terminal stuff
        vim.keymap.set("n", "<leader>nht", function()
            vim.cmd.vnew()
            vim.cmd.term()
            vim.cmd.wincmd("J")
            vim.api.nvim_win_set_height(0, math.floor((vim.o.lines) / 2))
        end, { desc = "[N]ew [H]orizontal [T]erminal" })

        vim.keymap.set("n", "<leader>nvt", function()
            vim.cmd.vnew()
            vim.cmd.term()
        end, { desc = "[N]ew [V]ertical [T]erminal" })

      require("luasnip.loaders.from_vscode").lazy_load()

      vim.keymap.set('i', '<C-c>', '<Esc>`^')
      vim.keymap.set('n', '<C-c>', '<Esc>`^')
      vim.keymap.set('v', '<C-c>', '<Esc>`^')
      vim.g.omni_sql_no_default_maps = 1
    '';
}
