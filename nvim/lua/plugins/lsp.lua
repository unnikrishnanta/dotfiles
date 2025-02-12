return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.ruff.setup {
                init_options = {
                    settings = {
                        -- Any extra CLI arguments for `ruff` go here.
                        args = {},
                    }
                }
            }
            lspconfig.pyright.setup{
                settings = {
                    pyright = {
                        -- Using Ruff's import organizer
                        disableOrganizeImports = true,
                    },
                    python = {
                        analysis = {
                            -- Ignore all files for analysis to exclusively use Ruff for linting
                            ignore = { '*' },
                        },
                    },
                },

            }
        end
    },
    { "folke/lsp-colors.nvim" },
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "mason.nvim" },
        config = function()
            require("mason-lspconfig").setup(
                {
                    ensure_installed = { "pyright", "ruff"}
                }
            )
        end
    },
}
