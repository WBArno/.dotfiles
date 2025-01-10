return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        config = function()
            -- Load Theme
            require("catppuccino").setup({
                colorscheme = "dark_catppuccino",
            })

            -- Load Scheme
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
}