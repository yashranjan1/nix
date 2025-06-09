{ lib }:
{
  autocomplete.nvim-cmp = {
    enable = true;
  
    setupOpts = {
      snippet = lib.mkForce {
        __raw = ''
          {
            expand = function(args)
              require("luasnip").lsp_expand(args.body)
            end
          }
        '';
      };
  
      completion.completeopt = "menu,menuone,noinsert";
  
      sources = lib.mkForce [
        {
          name = "lazydev";
          group_index = 0;
        }
        { name = "nvim_lsp"; }
        { name = "luasnip"; }
        { name = "path"; }
        { name = "nvim_lsp_signature_help"; }
      ];
    };
  
    mappings = {
      next = "<C-n>";
      previous = "<C-p>";
      scrollDocsDown = "<C-f>";
      scrollDocsUp = "<C-b>";
      confirm = "<C-y>";
      complete = "<C-Space>";
      close = null;
    };
  };
}
