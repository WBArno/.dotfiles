return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,

        config = function()
            -- Load Scheme
            vim.cmd([[colorscheme catppuccin]])
        end,
    },
}