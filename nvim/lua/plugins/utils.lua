return {
    { "junegunn/fzf" },
    { "junegunn/fzf.vim" },
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    { "tpope/vim-unimpaired" },
    { "numToStr/Comment.nvim", lazy = false },
    { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    { "github/copilot.vim" },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    {
        "gbprod/substitute.nvim",
        config = function()
        end
    },
}
