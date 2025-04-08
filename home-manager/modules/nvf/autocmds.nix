{ pkgs } : [
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
]
