#Default color scheme if theme.lua is not found
vim.cmd.colorscheme("habamax")

require("rmuell9.remap")
require("rmuell9.set")
require("rmuell9.lazy_init")

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command('ReloadTheme', function()
    local theme_spec = require('rmuell9.lazy.theme')
    if theme_spec.name then
        require('lazy').load({ plugins = { theme_spec.name } })
    end
    local max_attempts = 10
    local attempt = 0
    local function try_apply_theme()
        attempt = attempt + 1
        if not theme_spec.config then return end
        local ok, err = pcall(theme_spec.config)
        if ok then return end
        if attempt < max_attempts then
            vim.defer_fn(try_apply_theme, 50 * attempt)
        else
            vim.notify('Failed to reload theme: ' .. tostring(err),
                vim.log.levels.ERROR)
        end
    end
    vim.defer_fn(try_apply_theme, 50)
end, {})
