{
  keymaps = [
    {
      key = "<leader>o";
      action = "<cmd>Oil<CR>";
      mode = "n";
      desc = "Opens [O]il.nvim window";
    }
    {
      key = "<leader>y";
      action = ''"+y'';
      mode = [ "n" "v" ];
      desc = "[Y]ank to system clipboard";
    }
    {
      key = "<leader>p";
      action = ''"+p'';
      mode = [ "n" "v" ];
      desc = "[P]aste from system clipboard";
    }
    # INFO: Telescope binds
    {
      key = "<leader>sh";
      mode = "n";
      action = "<cmd>lua require('telescope.builtin').help_tags()<CR>";
      desc = "[S]earch [H]elp";
    }
    {
      key = "<leader>sk";
      mode = "n";
      action = "<cmd>lua require('telescope.builtin').keymaps()<CR>";
      desc = "[S]earch [K]eymaps";
    }
    {
      key = "<leader>sf";
      mode = "n";
      action =
        "<cmd>lua require('telescope.builtin').find_files({ hidden = true })<CR>";
      desc = "[S]earch [F]iles";
    }
    {
      key = "<leader>ss";
      mode = "n";
      action = "<cmd>lua require('telescope.builtin').builtin()<CR>";
      desc = "[S]earch [S]elect Telescope";
    }
    {
      key = "<leader>sw";
      mode = "n";
      action = "<cmd>lua require('telescope.builtin').grep_string()<CR>";
      desc = "[S]earch current [W]ord";
    }
    {
      key = "<leader>sg";
      mode = "n";
      action = "<cmd>lua require('telescope.builtin').live_grep()<CR>";
      desc = "[S]earch by [G]rep";
    }
    {
      key = "<leader>sd";
      mode = "n";
      action = "<cmd>lua require('telescope.builtin').diagnostics()<CR>";
      desc = "[S]earch [D]iagnostics";
    }
    {
      key = "<leader>sr";
      mode = "n";
      action = "<cmd>lua require('telescope.builtin').resume()<CR>";
      desc = "[S]earch [R]esume";
    }
    {
      key = "<leader>s.";
      mode = "n";
      action = "<cmd>lua require('telescope.builtin').oldfiles()<CR>";
      desc = "[S]earch Recent Files ('.' for repeat)";
    }
    {
      key = "<leader><leader>";
      mode = "n";
      action = "<cmd>lua require('telescope.builtin').buffers()<CR>";
      desc = "[ ] Find existing buffers";
    }
    {
      mode = "n";
      key = "<leader>/";
      action =
        "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ winblend = 10, previewer = false }))<CR>";
      desc = "[/] Fuzzily search in current buffer";
    }
    {
      mode = "n";
      key = "<leader>s/";
      action =
        "<cmd>lua require('telescope.builtin').live_grep({ grep_open_files = true, prompt_title = 'Live Grep in Open Files' })<CR>";
      desc = "[S]earch [/] in Open Files";
    }
    {
      mode = "n";
      key = "<leader>sn";
      action =
        "cmd> lua require('telescope.builtin').find_files { cwd = vim.fn.stdpath('config') } <CR>";
      desc = "[S]earch [N]eovim files";
    }
    {
      key = "gd";
      mode = "n";
      action = "<cmd>Telescope lsp_definitions<CR>";
      desc = "[G]o to [D]efinitions";
    }
    {
      key = "gr";
      mode = "n";
      action = "<cmd>Telescope lsp_references<CR>";
      desc = "[G]o to [R]eferences";
    }
    {
      key = "<leader>ca";
      mode = "n";
      action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      desc = "[C]ode [A]ctions";
    }
    {
      key = "<leader>st";
      mode = "n";
      action = "<cmd>TodoTelescope<CR>";
      desc = "[S]earch [T]odo comments";
    }
    # Navigation
    {
      key = "<leader>bd";
      mode = "n";
      action = "<cmd>bdelete<CR>";
      desc = "[B]uffer [D]elete";
    }
    {
      key = "<S-l>";
      mode = "n";
      action = "<cmd>tabnext<CR>";
      desc = "Next Tab";
    }
    {
      key = "<S-h>";
      mode = "n";
      action = "<cmd>tabprevious<CR>";
      desc = "Previous Tab";
    }
    {
      key = "<C-j>";
      mode = "n";
      action = "<cmd>wincmd j<CR>";
      desc = "Go to the split below";
    }
    {
      key = "<C-k>";
      mode = "n";
      action = "<cmd>wincmd k<CR>";
      desc = "Go to the split above";
    }
    {
      key = "<C-l>";
      mode = "n";
      action = "<cmd>wincmd l<CR>";
      desc = "Go to the split to the right";
    }
    {
      key = "<C-h>";
      mode = "n";
      action = "<cmd>wincmd h<CR>";
      desc = "Go to the split to the left";
    }
    {
      key = "<leader>nvw";
      mode = "n";
      action = "<cmd>vsplit<CR>";
      desc = "[N]ew [V]ertical [W]indow";
    }
    {
      key = "<leader>nhw";
      mode = "n";
      action = "<cmd>horizontal split<CR>";
      desc = "[N]ew [H]orizontal [W]indow";
    }
    {
      key = "<leader>ntr";
      mode = "n";
      action = "<cmd>tabnew<CR>";
      desc = "[N]ew [T]ab [R]ight";
    }
    {
      key = "<leader>ntl";
      mode = "n";
      action = "<cmd>-tabnew<CR>";
      desc = "[N]ew [T]ab [L]eft";
    }
    {
      key = "<Up>";
      mode = "n";
      action = "<cmd>resize +2<CR>";
    }
    {
      key = "<Down>";
      mode = "n";
      action = "<cmd>resize -2<CR>";
    }
    {
      key = "<Left>";
      mode = "n";
      action = "<cmd>vertical resize +5<CR>";
    }
    {
      key = "<Right>";
      mode = "n";
      action = "<cmd>vertical resize -5<CR>";
    }
    # errors
    {
      key = "<leader>eo";
      mode = "n";
      action = "<cmd>lua vim.diagnostic.open_float()<CR>";
      desc = "[O]pen diagnostic window";
    }
    {
      key = "<leader>en";
      mode = "n";
      action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
      desc = "[N]ext diagnostic message";
    }
    {
      key = "<leader>ep";
      mode = "n";
      action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
      desc = "[P]revious diagnostic message";
    }
  ];
}
