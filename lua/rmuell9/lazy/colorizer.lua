return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        vim.keymap.set("n", "<leader>cc", ":ColorizerToggle<CR>")
    end
}
