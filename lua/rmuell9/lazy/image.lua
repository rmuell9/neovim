return {
    "3rd/image.nvim",
    build = false,
    opts = {
        processor = "magick_cli",
        backend = "kitty",
        integrations = {},
        max_width = 100,
        max_height = 12,
        max_height_window_percentage = math.huge,
        max_width_window_percentage = math.huge,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
        tmux_show_only_in_active_window = true,
    },
    keys = {
        {
            "<leader>le",
            function()
                require("image").enable()
            end,
            desc = "Enable image rendering",
        },
        {
            "<leader>ld",
            function()
                require("image").disable()
            end,
            desc = "Disable image rendering",
        },
    },
}
