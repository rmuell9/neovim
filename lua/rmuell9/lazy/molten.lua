return {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20

            vim.keymap.set("n", "<leader>el", ":MoltenEvaluateLine<CR>",
                { silent = true, desc = "Molten evaluate line" })
            vim.keymap.set("v", "<leader>ev", ":<C-u>MoltenEvaluateVisual<CR>gv",
                { silent = true, desc = "Molten evaluate visual" })
            vim.keymap.set("n", "<leader>eo", ":MoltenEnterOutput<CR>",
                { silent = true, desc = "Molten enter output" })
            vim.keymap.set("n", "<leader>ed", ":MoltenDelete<CR>",
                { silent = true, desc = "Molten delete output" })
            vim.keymap.set('n', '<leader>ei', function()
              -- Get the current directory name as kernel name
              local kernel_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
              vim.cmd('MoltenInit ' .. kernel_name)
            end, { desc = 'Molten: Init kernel for current project' })
        end,
}


