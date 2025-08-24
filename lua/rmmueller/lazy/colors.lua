function ColorMyPencils(color)
    color = color or "tokyonight-moon"
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
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
                styles = {
                    italic = false,
                },
            })

            ColorMyPencils();
        end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                transparent = true,
                styles = {
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
            ColorMyPencils("tokyonight-moon")
        end
    },
}
