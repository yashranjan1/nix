{ pkgs }: {
  binds.whichKey = {
    enable = true;
    register = pkgs.lib.mkForce {
      "<leader>c" = "[C]ode";
      "<leader>n" = "[N]ew";
      "<leader>nv" = "[N]ew [V]ertical";
      "<leader>nh" = "[N]ew [H]orizontal";
      "<leader>nt" = "[N]ew [T]ab";
      "<leader>b" = "[B]uffer";
      "<leader>s" = "[S]earch";
      "<leader>t" = "[T]ab";
      "<leader>e" = "[E]rror Diagnostics";
    };
  };
}
