{ pkgs }: {
  binds.whichKey = {
    enable = true;
    register = pkgs.lib.mkForce {
      "<leader>c" = "[C]ode";
      "<leader>n" = "[N]ew";
      "<leader>b" = "[B]uffer";
      "<leader>s" = "[S]earch";
      "<leader>t" = "[T]ab";
      "<leader>e" = "[E]rror Diagnostics";
      "<leader>r" = "Te[R]minal";
    };
  };
}
