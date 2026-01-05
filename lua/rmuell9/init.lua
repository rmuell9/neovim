#Default color scheme if theme.lua is not found
vim.cmd.colorscheme("habamax")

require("rmuell9.remap")
require("rmuell9.set")
require("rmuell9.lazy_init")

vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
