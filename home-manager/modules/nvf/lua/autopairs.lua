local cmp_status, cmp = pcall(require, "cmp")
local autopairs_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

if cmp_status and autopairs_status then
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end
