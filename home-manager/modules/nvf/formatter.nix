{
  formatter.conform-nvim = {
    enable = true;
    
    setupOpts = {
      notify_on_error = false;
      
      formatters_by_ft = {
        lua = [ "stylua" ];
        python = [ "isort" "black" ];
        javascript = {
          __raw = ''{ "prettierd", "prettier", stop_after_first = true }'';
        };
    };
    
    format_on_save = {
      __raw = ''
        function(bufnr)
          local disable_filetypes = { c = true, cpp = true }
          local lsp_format_opt
          if disable_filetypes[vim.bo[bufnr].filetype] then
            lsp_format_opt = "never"
          else
            lsp_format_opt = "fallback"
          end
          return {
            timeout_ms = 500,
            lsp_format = lsp_format_opt,
          }
        end
      '';
      };
    };
  };
}
