{ pkgs, ... }: {
  package = pkgs.vimPlugins.tiny-inline-diagnostic-nvim;
  setupModule = "tiny-inline-diagnostic";
  setupOpts = { preset = "amongus"; };

  lazy = true;

  # load on event
  event = [ "LspAttach" ];

  priority = 1000;

}
