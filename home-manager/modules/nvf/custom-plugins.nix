{ pkgs, ... }: {
  lazy.plugins = {
    "tiny-inline-diagnostic.nvim" =
      import ./extra-plugins/tiny-inline-diagnostic.nix { inherit pkgs; };
  };
}
