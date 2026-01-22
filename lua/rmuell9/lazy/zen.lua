-- This is vibe-coded to hell but it works!
return {
    "folke/zen-mode.nvim",
    config = function()
        local function is_normal_buffer()
            local buftype = vim.bo.buftype
            local filetype = vim.bo.filetype
            local excluded_filetypes = {
                "oil", "neo-tree", "NvimTree", "TelescopePrompt"
            }
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

        local zen_was_active = false

        local function restore_normal_state()
            require("zen-mode").close()
            vim.wo.number = true
            vim.wo.rnu = true
            vim.opt.colorcolumn = "80"
        end

        local function create_quit_wrapper(cmd)
            return function()
                if require("zen-mode.view").is_open() then
                    vim.cmd(cmd)
                    vim.cmd(cmd)
                else
                    vim.cmd(cmd)
                end
            end
        end

        vim.api.nvim_create_user_command("Q", create_quit_wrapper("q"), {})
        vim.api.nvim_create_user_command("Wq", create_quit_wrapper("wq"), {})
        vim.api.nvim_create_user_command("WQ", create_quit_wrapper("wq"), {})

        vim.keymap.set("ca", "q", function()
            if require("zen-mode.view").is_open() then
                return "q|q"
            end
            return "q"
        end, { expr = true })

        vim.keymap.set("ca", "wq", function()
            if require("zen-mode.view").is_open() then
                return "wq|q"
            end
            return "wq"
        end, { expr = true })

        vim.keymap.set("ca", "q!", function()
            if require("zen-mode.view").is_open() then
                return "q!|q!"
            end
            return "q!"
        end, { expr = true })

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
            zen_was_active = false
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

        vim.api.nvim_create_autocmd("BufLeave", {
            callback = function()
                if require("zen-mode.view").is_open() then
                    zen_was_active = true
                    restore_normal_state()
                end
            end,
        })

        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                vim.schedule(function()
                    local filetype = vim.bo.filetype
                    local buftype = vim.bo.buftype
                    if filetype == "oil" or buftype ~= "" then
                        return
                    end
                    if zen_was_active and is_normal_buffer() then
                        zen_was_active = false
                        vim.api.nvim_feedkeys(
                            vim.api.nvim_replace_termcodes(
                                "<leader>zZ", true, false, true
                            ),
                            "m",
                            false
                        )
                    end
                end)
            end,
        })
    end
}
