{pkgs}: {
  lsp = {
    lspconfig = {
      enable = true;
      sources = {
        vue_ls = ''
          vim.lsp.config('vue_ls', {})
          vim.lsp.enable('vue_ls')
        '';
        ts_ls = ''
          vim.lsp.config('ts_ls', {
            init_options = {
              plugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = "${pkgs.vue-language-server}/lib/node_modules/@vue/language-server",
                  languages = {"vue"},
                },
              },
            },
            filetypes = {
              "javascript",
              "typescript",
              "vue",
            },
          })
          vim.lsp.enable('ts_ls')
        '';
      };
    };
    lspSignature.enable = true;
    mappings = {
      addWorkspaceFolder = null;
      codeAction = null;
      documentHighlight = null;
      format = null;
      goToDeclaration = null;
      goToDefinition = null;
      goToType = null;
      hover = null;
      listDocumentSymbols = null;
      listImplementations = null;
      listReferences = null;
      listWorkspaceFolders = null;
      listWorkspaceSymbols = null;
      nextDiagnostic = null;
      openDiagnosticFloat = null;
      previousDiagnostic = null;
      removeWorkspaceFolder = null;
      renameSymbol = null;
      signatureHelp = null;
      toggleFormatOnSave = null;
    };
  };
}
