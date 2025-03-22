{
  config,
  pkgs,
  lib,
  ...
}: 
  let 
  	flakeDir = "home/takina/nix";
  in
  {
  xdg = {
    configFile.nvim.source = ../../nvim;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
