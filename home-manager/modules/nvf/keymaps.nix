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
      key = "<C-a>";
      action = "<Esc>";
      mode = "i";
      silent = true;
    }
    {
      key = "<leader>o";
      action = "<cmd>Oil<CR>";
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
    # Telescope binds
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
      action = "<cmd>lua require('telescope.builtin').find_files()<CR>";
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
      action = "<cmd>lua require('telescope.builtin').lsp_definitions<CR>";
      desc = "[G]o to [D]efinitions";
    }
    {
      key = "gr";
      mode = "n";
      action = "<cmd>lua require('telescope.builtin').lsp_references<CR>";
      desc = "[G]o to [R]eferences";
    }
    {
      key = "<leader>bd";
      mode = "n";
      action = "<cmd>bdelete<CR>";
      desc = "[B]uffer [D]elete";
    }
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
    {
      key = "<leader>ca";
      mode = "n";
      action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      desc = "[C]ode [A]ctions";
    }
  ];
}
