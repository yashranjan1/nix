{ pkgs, ... } : {
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

                mini = {
                    statusline = {
                        enable = true;
                    };
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

                options = import ./options.nix;
                autocomplete.nvim-cmp = import ./cmp.nix;
                formatter = import ./formatter.nix;
                binds.whichKey = import ./which-key.nix { inherit pkgs; };
                languages = import ./languages.nix;
                git = import ./git.nix;
                lsp = import ./lsp.nix;
                theme = import ./theme.nix;
                keymaps = import ./keymaps.nix;
                autocmds = import ./autocmds.nix { inherit pkgs; };
                extraLuaFiles = [ ./lsp.lua ];
            };

            imports = [
                (import ./telescope.nix { inherit pkgs; })
            ];
        };
    };
}
