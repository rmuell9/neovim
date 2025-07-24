return {
    'CRAG666/code_runner.nvim',
    config = function()
        vim.keymap.set('n', '<leader>rr', ':w<CR>:RunCode<CR>')
        vim.keymap.set('n', '<leader>rc', ':RunClose<CR>')
        require('code_runner').setup {
            filetype = {
                python = 'python3 -u',
                ruby = 'ruby',
                lisp = function()
                    local file = vim.fn.expand '%:p'
                    return string.format('sbcl --script %s', file)
                end,
                scheme = function()
                    local file = vim.fn.expand '%:p'
                    return string.format('guile %s', file)
                end,
            },
        }
    end,
}
