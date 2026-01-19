return {
    "folke/zen-mode.nvim",
    config = function()
        vim.keymap.set("n", "<leader>zz", function()
            require("zen-mode").setup {
                window = {
                    width = 90,
                    options = { }
                },
            }
            require("zen-mode").toggle()
            vim.wo.wrap = false
            vim.wo.number = true
            vim.wo.rnu = true
        end)


        vim.keymap.set("n", "<leader>zZ", function()
            require("zen-mode").setup {
                window = {
                    width = 80,
                    options = { }
                },
            }
            require("zen-mode").toggle()
            vim.wo.wrap = false
            vim.wo.number = false
            vim.wo.rnu = false
            vim.opt.colorcolumn = "0"
        end)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function()
                vim.schedule(function()
                    require("zen-mode").setup {
                        window = {
                            width = 80,
                            options = { }
                        },
                    }
                    require("zen-mode").toggle()
                    vim.wo.wrap = false
                    vim.wo.number = false
                    vim.wo.rnu = false
                    vim.opt.colorcolumn = "0"
                    vim.cmd("normal! gg")
                end)
            end,
        })
    end
}
