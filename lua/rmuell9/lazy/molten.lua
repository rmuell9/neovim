return {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        dependencies = { "3rd/image.nvim" },
        build = ":UpdateRemotePlugins",
        init = function()
            -- these are examples, not defaults. Please see the readme
            vim.g.molten_image_provider = "image.nvim"
            vim.g.molten_output_win_max_height = 20

            vim.keymap.set("n", "<leader>jv", ":MoltenEvaluateLine<CR>",
                { silent = true, desc = "Molten evaluate line" })
            vim.keymap.set("v", "<leader>jv", ":<C-u>MoltenEvaluateVisual<CR>gv",
                { silent = true, desc = "Molten evaluate visual" })
            vim.keymap.set("n", "<leader>jo", ":MoltenEnterOutput<CR>",
                { silent = true, desc = "Molten enter output" })
            vim.keymap.set("n", "<leader>jd", ":MoltenDelete<CR>",
                { silent = true, desc = "Molten delete output" })
        end,
}


