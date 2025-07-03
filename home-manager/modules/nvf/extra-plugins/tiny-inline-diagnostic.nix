{ pkgs, ... }: {
  package = pkgs.vimPlugins.tiny-inline-diagnostic-nvim;
  setupModule = "tiny-inline-diagnostic";
  setupOpts = {
    preset = "amongus";

    # transparent_bg = false;
    # transparent_cursorline = false;
    #
    # hi = {
    #   error = "DiagnosticError";
    #   warn = "DiagnosticWarn";
    #   info = "DiagnosticInfo";
    #   hint = "DiagnosticHint";
    #   arrow = "NonText";
    #
    #   # Background color for diagnostics
    #   # Can be a highlight group or a hexadecimal color (#RRGGBB)
    #   background = "CursorLine";
    #
    #   mixing_color = "None";
    # };
    #
    # options = {
    #   show_source = {
    #     enabled = false;
    #     if_many = false;
    #   };
    #
    #   use_icons_from_diagnostic = false;
    #
    #   set_arrow_to_diag_color = false;
    #
    #   throttle = 20;
    #
    #   softwrap = 30;
    #
    #   # -- Configuration for multiline diagnostics
    #   # -- Can either be a boolean or a table with the following options:
    #   # --  multilines = {
    #   # --      enabled = false,
    #   # --      always_show = false,
    #   # -- }
    #   # -- If it set as true, it will enable the feature with this options:
    #   # --  multilines = {
    #   # --      enabled = true,
    #   # --      always_show = false,
    #   # -- }
    #   multilines = {
    #     enabled = true;
    #
    #     always_show = false;
    #
    #     trim_whitespaces = false;
    #
    #     tabstop = 4;
    #   };
    #
    #   show_all_diags_on_cursorline = false;
    #
    #   enable_on_insert = false;
    #
    #   enable_on_select = false;
    #
    #   overflow = {
    #     # -- Manage how diagnostic messages handle overflow
    #     # -- Options:
    #     # -- "wrap" - Split long messages into multiple lines
    #     # -- "none" - Do not truncate messages
    #     # -- "oneline" - Keep the message on a single line, even if it's long
    #     mode = "wrap";
    #
    #     padding = 0;
    #   };
    #
    #   break_line = {
    #     enabled = true;
    #
    #     after = 30;
    #   };
    #
    #   # -- Custom format function for diagnostic messages
    #   # -- Example:
    #   # -- format = function(diagnostic)
    #   # --     return diagnostic.message .. " [" .. diagnostic.source .. "]"
    #   # -- end
    #   # format = null;
    #
    #   virt_texts = { priority = 2048; };
    #
    #   # -- Filter diagnostics by severity
    #   # -- Available severities:
    #   # -- vim.diagnostic.severity.ERROR
    #   # -- vim.diagnostic.severity.WARN
    #   # -- vim.diagnostic.severity.INFO
    #   # -- vim.diagnostic.severity.HINT
    #   severity = [
    #     "vim.diagnostic.severity.ERROR"
    #     "vim.diagnostic.severity.WARN"
    #     "vim.diagnostic.severity.INFO"
    #     "vim.diagnostic.severity.HINT"
    #   ];
    #
    #   overwrite_events = null;
    # };

    # List of filetypes to disable the plugin
    # disabled_ft = { };
  };

  lazy = true;

  # load on event
  event = [ "LspAttach" ];

  priority = 1000;

}
