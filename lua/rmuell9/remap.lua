vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":Oil<CR>")

vim.keymap.set("n", "<leader>m", ":split notepad.md <CR>")

vim.keymap.set("x", "<leader>p", [["_dP]]) -- Paste that preserves clipboard

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Yank to system clipboard

vim.keymap.set("n", "<leader>Y", [["+Y]]) -- Yank from cursor to end of line

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d") -- Delete without yanking

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>t", "<cmd>ReloadTheme<CR>")
