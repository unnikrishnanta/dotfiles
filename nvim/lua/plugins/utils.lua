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
        opts = {
        }
    },
    {
        "nvim-neotest/neotest",
        config = function()
            require("neotest").setup({
                adapters = {
                    require("neotest-python")({
                        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
                        dap = { justMyCode = false },
                        args = {"--log-level", "DEBUG"},
                        -- Runner to use. Will use pytest if available by default.
                        runner = "pytest",
                        python = "/Users/ukrishnan/.pyenv/shims/python",
                    })
                }
            })
        end,
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "nvim-neotest/neotest-python",
            "nvim-neotest/neotest-plenary",
            "nvim-neotest/nvim-nio"
        },
    },
}
