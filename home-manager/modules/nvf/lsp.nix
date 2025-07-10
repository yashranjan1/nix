{ pkgs }: {
  lsp = {
    null-ls.enable = true;
    formatOnSave = true;
    servers = {
      vue_ls = { };
      vtsls = { };
      basedpyright = { };
      nixd = { };
      phpactor = { };
      gopls = { };
      tailwindcss = { };
      marksman = { };
      html = { };
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
