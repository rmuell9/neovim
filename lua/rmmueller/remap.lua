vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Oil<CR>")
vim.keymap.set("n", "<leader>m", ":split notepad.md <CR>")

vim.keymap.set('n', '%s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>')

