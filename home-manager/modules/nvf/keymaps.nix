[
    {
        key = "<left>"; 
        mode = "n"; 
        action = "<cmd><CR>";
        silent = true;
    }
    {
        key = "<right>";
        mode = "n"; 
        action = "<cmd><CR>";
        silent = true;
    }
    {
        key = "<up>";
        mode = "n"; 
        action = "<cmd><CR>";
        silent = true;
    }
    {
        key = "<down>"; 
        mode = "n"; 
        action = "<cmd><CR>";
        silent = true;
    }
    {
        key = "<leader>f";
        action = ''<cmd>lua require("conform").format({ async = true, lsp_format = "fallback" })<CR>'';
        mode = "n";
        desc = "[F]ormat buffer";
    }
]

