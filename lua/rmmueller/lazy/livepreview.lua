return{
    'brianhuster/live-preview.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    config = function()

        vim.keymap.set('n', '<leader>lp', ':w<CR>:LivePreview  start<CR>')
        vim.keymap.set('n', '<leader>lc', ':LivePreview close<CR>')

    end

}
