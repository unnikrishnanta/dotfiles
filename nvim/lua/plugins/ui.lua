return {
    { "nvim-lualine/lualine.nvim", dependencies = { 'nvim-tree/nvim-web-devicons' } },
    { "b0o/incline.nvim" },
    { "folke/noice.nvim", dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },
    {
        'stevearc/oil.nvim',
        opts = {},
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        config = function()
            require("oil").setup()
        end,
    },
    { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
}
