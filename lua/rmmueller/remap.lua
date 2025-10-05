vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Oil<CR>")
vim.keymap.set("n", "<leader>m", ":split notepad.md <CR>")

vim.keymap.set('n', '%s', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>')

-- See diagnostic under cursor 
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)

-- See all diagnostics in the file
vim.keymap.set("n", "<leader>e", vim.diagnostic.setloclist)

-- Go to next diagnostic
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

-- Go to previous diagnostic
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
