return {
    "folke/zen-mode.nvim",
    config = function()
        local function is_normal_buffer()
            local buftype = vim.bo.buftype
            local filetype = vim.bo.filetype
            local excluded_filetypes = { "oil", "neo-tree", "NvimTree", "TelescopePrompt" }
            if buftype ~= "" then
                return false
            end
            for _, ft in ipairs(excluded_filetypes) do
                if filetype == ft then
                    return false
                end
            end
            return true
        end

        local function restore_normal_state()
            require("zen-mode").close()
            vim.wo.number = true
            vim.wo.rnu = true
            vim.opt.colorcolumn = "80"
        end

        vim.keymap.set("n", "<leader>zz", function()
            if not is_normal_buffer() then
                return
            end
            require("zen-mode").setup {
                window = {
                    width = 90,
                    options = { }
                },
            }
            require("zen-mode").toggle()
            vim.wo.number = true
            vim.wo.rnu = true
        end)


        vim.keymap.set("n", "<leader>zZ", function()
            if not is_normal_buffer() then
                return
            end
            require("zen-mode").setup {
                window = {
                    width = 80,
                    options = { }
                },
            }
            require("zen-mode").toggle()
                vim.wo.number = false
                vim.wo.rnu = false
                vim.opt.colorcolumn = "0"
        end)

        vim.keymap.set("n", "<leader>zq", function()
            restore_normal_state()
        end)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function()
                vim.schedule(function()
                    if not is_normal_buffer() then
                        return
                    end
                    vim.api.nvim_feedkeys(
                        vim.api.nvim_replace_termcodes(
                            "<leader>zZ", true, false, true
                        ),
                        "m",
                        false
                    )
                end)
            end,
        })

        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                vim.schedule(function()
                    local filetype = vim.bo.filetype
                    local buftype = vim.bo.buftype
                    if filetype == "oil" or buftype ~= "" then
                        restore_normal_state()
                    end
                end)
            end,
        })
    end
}
