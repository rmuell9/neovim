vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>m", ":split notepad.md <CR>")

--Code runner plugin
vim.keymap.set('n', '<leader>rr', ':w<CR>:RunCode<CR>')
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>')

--Live_preview plugin
vim.keymap.set('n', '<leader>lp', ':w<CR>:LivePreview  start<CR>')
vim.keymap.set('n', '<leader>lc', ':LivePreview close<CR>')

