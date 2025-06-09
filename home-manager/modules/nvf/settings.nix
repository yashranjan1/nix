{
  pkgs,
  lib,
  ...
}: 
{
  # alias stuff
  vimAlias = true;
  viAlias = true;
  
  scrollOffset = 20;
  clipboard = {
    enable = true;
    providers.wl-copy.enable = true;
  };
  
  # undo
  undoFile.enable = true;
  
  # global opts
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  
  lazy = {
    plugins = {
      telescope.event = "VimEnter";
    };
  };
  
  treesitter = {
    mappings.incrementalSelection = {
      decrementByNode = null;
      incrementByNode = null;
      incrementByScope = null;
      init = null;
    };
  };

  extraLuaFiles = [
    ./lua/lsp.lua
    ./lua/map.lua
    ./lua/autopairs.lua
  ];
  
  extraPackages = with pkgs; [
    vue-language-server
    typescript-language-server
    vscode-langservers-extracted
  ];
}
