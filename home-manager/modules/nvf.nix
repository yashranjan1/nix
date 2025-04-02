{ pkgs, ...} : {
    programs.nvf = {
        enable = true;

        settings = {
            vim = {
                # alias stuff
                vimAlias = true;
                viAlias = true;

                scrollOffset = 20;
                useSystemClipboard = true;
                            
                # undo
                undoFile.enable = true;

                # global opts
                globals = {
                    mapleader = " ";
                    maplocalleader = " ";
                };
                # opts 
                options = {
                    showmode = false;
                    mouse = "a";
                    tabstop = 4;
                    shiftwidth = 4;
                    signcolumn = "yes";
                    updatetime = 250;
                    splitright = true;
                    splitbelow = true;
                    cursorlineopt = "line";

                };

                # theme
                theme = {
                    enable = true;
                    style = "mocha";
                    name = "catppuccin";
                };

                # keymap
                keymaps = [
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
                ];

                autocmds = [
                    {
                        desc = "Highlight when yanking";
                        event = [
                            "TextYankPost"
                        ];
                        # group = "KickstackHighlightYank";
                        callback =  pkgs.lib.generators.mkLuaInline ''
                            function()
                                vim.highlight.on_yank()
                            end
                        '';
                    }
                ];

                # languages
                languages = {
                    nix.enable = true;
                    ts.enable = true;
                    python.enable = true;
                    sql.enable = true;
                    enableLSP = true;
                    enableTreesitter = true;
                };
                autocomplete.nvim-cmp.enable = true;

                mini = {
                    statusline = {
                        enable = true;
                    };
                };

                # telescope
                telescope = {
                    enable = true;
                };
            };
        };
    };
}
