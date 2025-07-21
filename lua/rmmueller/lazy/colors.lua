function ColorMyPencils(color)
    color = color or "gruvbox-material"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "ntk148v/habamax.nvim",
        dependencies = {"rktjmp/lush.nvim"},
        config = function()
            ColorMyPencils()
        end
    },
    {
        "sainnhe/gruvbox-material",
        config = function()
            ColorMyPencils()
        end
    },
}
