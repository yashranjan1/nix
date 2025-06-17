{ pkgs }: {
  autocmds = [{
    desc = "Highlight when yanking";
    event = [ "TextYankPost" ];
    callback = pkgs.lib.generators.mkLuaInline ''
      function()
      vim.highlight.on_yank()
      end
    '';
  }];
}
