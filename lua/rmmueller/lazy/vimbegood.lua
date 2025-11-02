return {
    "theprimeagen/vim-be-good",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        vim.keymap.set('n', '<leader>v', ':VimBeGood<CR>')
    end
}
