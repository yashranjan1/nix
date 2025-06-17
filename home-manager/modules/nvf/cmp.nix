{ lib }: {
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

      mapping = {
        "<C-l>" = lib.mkLuaInline ''
          cmp.mapping(function()
              if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
              end
          end, { 'i', 's' })
        '';
        "<C-h>" = lib.mkLuaInline ''
          cmp.mapping(function()
               if luasnip.locally_jumpable(-1) then
                   luasnip.jump(-1)
               end
           end, { "i", "s" })
        '';
      };

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
