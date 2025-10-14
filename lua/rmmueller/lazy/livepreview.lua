return{
    'brianhuster/live-preview.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    config = function()
        require('live-preview').setup({
            sync_scroll = true,
            dynamic_root = true,
            open_browser = true,
            browser = 'chromium',
        })

    end

}
