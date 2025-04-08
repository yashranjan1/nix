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

                lsp = {
                    mappings = {
                        addWorkspaceFolder = null;
                        codeAction = null;
                        documentHighlight = null;
                        format = null;
                        goToDeclaration = null;
                        goToDefinition = null;
                        goToType = null;
                        hover = null;
                        listDocumentSymbols = null;
                        listImplementations = null;
                        listReferences = null;
                        listWorkspaceFolders = null;
                        listWorkspaceSymbols = null;
                        nextDiagnostic = null;
                        openDiagnosticFloat = null;
                        previousDiagnostic = null;
                        removeWorkspaceFolder = null;
                        renameSymbol = null;
                        signatureHelp = null;
                        toggleFormatOnSave = null;
                    };
                };

                autocomplete.nvim-cmp = {
                    enable = true;
                    mappings = {
                        close = null;
                        complete = null;
                        confirm = null;
                        next = null;
                        previous = null;
                        scrollDocsDown = null;
                        scrollDocsUp = null;
                    };
                };

                mini = {
                    statusline = {
                        enable = true;
                    };
                };

                # telescope
                telescope = {
                    enable = true;
                    mappings = {
                        buffers = null;
                        diagnostics = null;
                        findFiles = "<leader>sf";
                        findProjects = null;
                        gitBranches = null;
                        gitBufferCommits = null;
                        gitCommits = null;
                        gitStash = null;
                        gitStatus = null;
                        helpTags = null;
                        liveGrep = null;
                        lspDefinitions = null;
                        lspDocumentSymbols = null;
                        lspImplementations = null;
                        lspReferences = null;
                        lspTypeDefinitions = null;
                        lspWorkspaceSymbols = null;
                        open = null;
                        resume = null;
                        treesitter = null;
                    };
                };

                git = {
                    git-conflict = {
                        mappings = {
                            both = null;
                            nextConflict = null;
                            none = null;
                            ours = null;
                            prevConflict = null;
                            theirs = null;
                        };
                    };
                    enable = true;
                    gitsigns = {
                        mappings = {
                            blameLine = null;
                            diffProject = null;
                            diffThis = null;
                            nextHunk = null;
                            previousHunk = null;
                            previewHunk = null;
                            resetBuffer = null;
                            resetHunk = null;
                            stageBuffer = null;
                            stageHunk = null;
                            toggleBlame = null;
                            toggleDeleted = null;
                            undoStageHunk = null;
                        }; 
                        enable = true;
                        codeActions.enable = true;
                        setupOpts = {
                            "signs" = {
                                "add" = { "text" = "+"; };
                                "change" = { "text" = "~"; };
                                "delete" = { "text" = "_"; };
                                "topdelete" = { "text" = "‾"; };
                                "changedelete" = { "text" = "~"; };
                            };
                        };
                    };
                };
                binds = {
                    whichKey = {
                        enable = true;
                        register = pkgs.lib.mkForce {
                            "<leader>s" = "[S]earch";
                            # "<leader>lg" = "Telescope Git";
                        };
                    };
                };
            };
        };
    };
}
