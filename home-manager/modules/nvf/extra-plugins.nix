{ pkgs, ... }: {
  extraPlugins = {
    harpoon = {
      package = pkgs.vimPlugins.harpoon2;
      setup = # lua
        ''
          local harpoon = require('harpoon')
          harpoon:setup()
          vim.keymap.set('n', '<leader>hx', function() harpoon:list():add() end, {desc = "[H]arpoon [X] mark"})
          vim.keymap.set('n', '<leader>hh', function() harpoon:list():select(1) end, {desc = "[H]arpoon [1]st file"})
          vim.keymap.set('n', '<leader>hj', function() harpoon:list():select(2) end, {desc = "[H]arpoon [2]nd file"})
          vim.keymap.set('n', '<leader>hk', function() harpoon:list():select(3) end, {desc = "[H]arpoon [3]rd file"})
          vim.keymap.set('n', '<leader>hl', function() harpoon:list():select(4) end, {desc = "[H]arpoon [4]th file"})
          vim.keymap.set('n', '<leader>hs', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = "[H]arpoon [S]how"})
          vim.keymap.set('n', '<leader>sm', "<cmd>Telescope harpoon marks<CR>", {desc = ""})
        '';
    };
  };
}
