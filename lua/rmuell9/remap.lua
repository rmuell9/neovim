vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":Oil<CR>")

vim.keymap.set("n", "<leader>m", ":split notepad.md <CR>")

vim.keymap.set("x", "<leader>p", [["_dP]]) -- Paste that preserves clipboard

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Yank to system clipboard

vim.keymap.set("n", "<leader>Y", [["+Y]]) -- Yank from cursor to end of line

vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d") -- Delete without yanking

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- replace in line
vim.keymap.set('n', "<leader>s", ':s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>')

-- replace in file
vim.keymap.set('n', "<leader>S", ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<Left><Left>')

vim.keymap.set("n", "<leader>lp", function()
  local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
  if venv ~= nil then
    -- in the form of /home/benlubas/.virtualenvs/VENV_NAME
    venv = string.match(venv, "/.+/(.+)")
    vim.cmd(("MoltenInit %s"):format(venv))
  else
    -- For uv projects, use current directory name as kernel name
    local kernel_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    -- Check if uv project (has pyproject.toml or .venv directory)
    if vim.fn.filereadable("pyproject.toml") == 1 or 
       vim.fn.isdirectory(".venv") == 1 then
      vim.cmd(("MoltenInit %s"):format(kernel_name))
    else
      vim.cmd("MoltenInit python3")
    end
  end
end, { desc = "Initialize Molten for python3", silent = true })
