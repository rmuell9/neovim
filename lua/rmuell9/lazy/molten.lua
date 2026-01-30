return {
    {
        "3rd/image.nvim",
        build = false,
        opts = {
            processor = "magick_cli",
            backend = "kitty",
            integrations = {},
            max_width = 100,
            max_height = 12,
            max_height_window_percentage = math.huge,
            max_width_window_percentage = math.huge,
            window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
            tmux_show_only_in_active_window = true,
        },
        keys = {
            {
                "<leader>le",
                function()
                    require("image").enable()
                end,
                desc = "Enable image rendering",
            },
            {
                "<leader>ld",
                function()
                    require("image").disable()
                end,
                desc = "Disable image rendering",
            },
        },
    },
    {
        "benlubas/molten-nvim",
        version = "^1.0.0",
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
            vim.g.python3_host_prog=vim.fn.expand(
                "~/.virtualenvs/neovim/bin/python3")
            vim.keymap.set("n", "<leader>jf", ":MoltenEvaluateLine<CR>",
                { silent = true, desc = "Molten evaluate line" })
            vim.keymap.set("v", "<leader>jf", ":<C-u>MoltenEvaluateVisual<CR>gv",
                { silent = true, desc = "Molten evaluate visual" })
            vim.keymap.set("n", "<leader>jo", function()
                local win_type = vim.fn.win_gettype()
                if win_type == "popup" then
                    vim.cmd("wincmd p")
                else
                    vim.cmd("noautocmd MoltenEnterOutput")
                end
            end, { silent = true, desc = "Molten toggle output" })
            vim.keymap.set("n", "<leader>jd", ":MoltenDelete<CR>",
                { silent = true, desc = "Molten delete output" })
            vim.keymap.set("n", "<leader>lp", function()
                local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
                if venv ~= nil then
                    venv = string.match(venv, "/.+/(.+)")
                    vim.cmd(("MoltenInit %s"):format(venv))
                else
                    local kernel_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
                    if vim.fn.filereadable("pyproject.toml") == 1 or 
                        vim.fn.isdirectory(".venv") == 1 then
                        vim.cmd(("MoltenInit %s"):format(kernel_name))
                    else
                        vim.cmd("MoltenInit python3")
                    end
                end
            end, { desc = "Initialize Molten for python3", silent = true })

            vim.g.molten_auto_open_output = false

            vim.g.molten_image_provider = "image.nvim"

            vim.g.molten_wrap_output = true

            vim.g.molten_virt_text_output = true

            vim.g.molten_virt_lines_off_by_1 = false

            vim.g.molten_enter_output_behavior = "open_and_enter"
        end,
    }
}
