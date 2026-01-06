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
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20
            vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
            vim.keymap.set("n", "<leader>jf", ":MoltenEvaluateLine<CR>",
                { silent = true, desc = "Molten evaluate line" })
            vim.keymap.set("v", "<leader>jf", ":<C-u>MoltenEvaluateVisual<CR>gv",
                { silent = true, desc = "Molten evaluate visual" })
            vim.keymap.set("n", "<leader>jo", ":MoltenEnterOutput<CR>",
                { silent = true, desc = "Molten enter output" })
            vim.keymap.set("n", "<leader>jd", ":MoltenDelete<CR>",
                { silent = true, desc = "Molten delete output" })
            vim.keymap.set("n", "<leader>lp", function()
                local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
                if venv ~= nil then
                    -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
                    venv = string.match(venv, "/.+/(.+)")
                    vim.cmd(("MoltenInit %s"):format(venv))
                else
                    -- For uv projects, use current directory name as kernel name
                    local kernel_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
                    -- Check if uv project (has pyproject.toml or .venv directory)
                    if vim.fn.filereadable("pyproject.toml") == 1 or 
                        vim.fn.isdirectory(".venv") == 1 then
                        vim.cmd(("MoltenInit %s"):format(kernel_name))
                    else
                        vim.cmd("MoltenInit python3")
                    end
                end
            end, { desc = "Initialize Molten for python3", silent = true })

            -- I find auto open annoying, keep in mind setting this option will require setting
            -- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
            vim.g.molten_auto_open_output = false

            -- this guide will be using image.nvim
            -- Don't forget to setup and install the plugin if you want to view image outputs
            vim.g.molten_image_provider = "image.nvim"

            -- optional, I like wrapping. works for virt text and the output window
            vim.g.molten_wrap_output = true

            -- Output as virtual text. Allows outputs to always be shown, works with images, but can
            -- be buggy with longer images
            vim.g.molten_virt_text_output = true

            -- this will make it so the output shows up below the \`\`\` cell delimiter
            vim.g.molten_virt_lines_off_by_1 = true
        end,
    }
}
