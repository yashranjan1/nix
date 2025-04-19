{
  pkgs,
  lib,
  ...
}: {
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        # alias stuff
        vimAlias = true;
        viAlias = true;

        scrollOffset = 20;
        useSystemClipboard = true;

        # undo
        undoFile.enable = true;

        # global opts
        globals = {
          mapleader = " ";
          maplocalleader = " ";
        };

        lazy = {
          plugins = {
            telescope.event = "VimEnter";
          };
        };

        treesitter = {
          mappings.incrementalSelection = {
            decrementByNode = null;
            incrementByNode = null;
            incrementByScope = null;
            init = null;
          };
        };

        options = import ./options.nix;
        autocomplete.nvim-cmp = import ./cmp.nix {inherit lib;};
        formatter = import ./formatter.nix;
        binds.whichKey = import ./which-key.nix {inherit pkgs;};
        languages = import ./languages.nix;
        git = import ./git.nix;
        lsp = import ./lsp.nix;
        theme = import ./theme.nix;
        keymaps = import ./keymaps.nix;
        autocmds = import ./autocmds.nix {inherit pkgs;};
        extraLuaFiles = [
          ./lua/lsp.lua
          ./lua/map.lua
          ./lua/autopairs.lua
        ];
        snippets = import ./snippets.nix;
        mini = import ./mini.nix;
        # notes.todo-comments = import ./todo.nix;
        autopairs = import ./auto-pairs.nix;
        utility = import ./extra-plugins/oil.nix;
        ui.noice = import ./extra-plugins/noice.nix;
        notify.nvim-notify = import ./extra-plugins/notify.nix;
      };

      imports = [
        (import ./telescope.nix {inherit pkgs;})
      ];
    };
  };
}
