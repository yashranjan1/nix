{ pkgs } :{
    enable = true;
    register = pkgs.lib.mkForce {
        "<leader>c" = "[C]ode";
        "<leader>d" = "[D]ocument";
        "<leader>r" = "[R]ename";
        "<leader>s" = "[S]earch";
        "<leader>w" = "[W]orkspace";
        "<leader>t" = "[T]oggle";
        "<leader>e" = "[E]rror Diagnostics";
        "<leader>h" = "Git [H]unk";
    };
}
