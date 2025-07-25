{ pkgs, ... }: {
  telescope = {
    setupOpts = {
      defaults = {
        layout_config = {
          horizontal = {
            prompt_position = "bottom";
            preview_width = 0.4;
          };
        };
        sorting_strategy = "descending";
      };
      pickers = {
        find_files = {
          find_command = [ "rg" "--files" "--hidden" "--glob" "!**/.git/*" ];
        };
      };
    };
    extensions = [
      {
        name = "ui-select";
        packages = [ pkgs.vimPlugins.telescope-ui-select-nvim ];
        setup = {
          ui-select = pkgs.lib.mkLuaInline
            "	require('telescope.themes').get_dropdown(),\n";
        };
      }
      { name = "harpoon"; }
    ];
    enable = true;
    mappings = {
      buffers = null;
      diagnostics = null;
      findFiles = null;
      findProjects = null;
      gitBranches = null;
      gitBufferCommits = null;
      gitCommits = null;
      gitStash = null;
      gitStatus = null;
      helpTags = null;
      liveGrep = null;
      lspDefinitions = null;
      lspDocumentSymbols = null;
      lspImplementations = null;
      lspReferences = null;
      lspTypeDefinitions = null;
      lspWorkspaceSymbols = null;
      open = null;
      resume = null;
      treesitter = null;
    };
  };
}
