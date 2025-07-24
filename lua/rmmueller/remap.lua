vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>m", ":split notepad.md <CR>")

--Code runner plugin
vim.keymap.set('n', '<leader>rr', ':w<CR>:RunCode<CR>')
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>')

--Live_preview plugin
vim.keymap.set('n', '<leader>lp', ':w<CR>:LivePreview  start<CR>')
vim.keymap.set('n', '<leader>lc', ':LivePreview close<CR>')

--Harpoon
vim.keymap.set('n', '<leader>hh', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
vim.keymap.set('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>')
vim.keymap.set('n', '<leader>hn', ':lua require("harpoon.ui").nav_next()<CR>')
vim.keymap.set('n', '<leader>hp', ':lua require("harpoon.ui").nav_prev()<CR>')
vim.keymap.set('n', '<leader>h1', ':lua require("harpoon.ui").nav_file(1)<CR>')
vim.keymap.set('n', '<leader>h2', ':lua require("harpoon.ui").nav_file(2)<CR>')
vim.keymap.set('n', '<leader>h3', ':lua require("harpoon.ui").nav_file(3)<CR>')
vim.keymap.set('n', '<leader>h4', ':lua require("harpoon.ui").nav_file(4)<CR>')
vim.keymap.set('n', '<leader>h5', ':lua require("harpoon.ui").nav_file(5)<CR>')
