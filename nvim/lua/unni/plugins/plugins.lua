local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "tpope/vim-surround",
    "tpope/vim-fugitive",
    "tpope/vim-unimpaired",
    "junegunn/fzf",
    "junegunn/fzf.vim",
    "tpope/vim-repeat",
    "rafamadriz/friendly-snippets", 
    "tpope/vim-abolish",
    "vim-test/vim-test",
    "nvim-tree/nvim-web-devicons",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    -- " For luasnip users.
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    {
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    { "ms-jpq/chadtree", branch = "chad", build = "python3 -m chadtree deps" },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function () 
          local configs = require("nvim-treesitter.configs")

          configs.setup({
              ensure_installed = {
                  "c", "lua", "vim", "vimdoc", "query", "python", "sql",
                  "terraform", "json", "git_config"
              },
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },  
            })
        end
     },
     {
         "nvim-telescope/telescope.nvim", tag = '0.1.5',
          dependencies = { 'nvim-lua/plenary.nvim' }
     },
     {
         "nvim-lualine/lualine.nvim",
         dependencies = { 'nvim-tree/nvim-web-devicons' },
     },
     {
        "AlexvZyl/nordic.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require 'nordic' .load()
        end
     },
     { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
     {
       'projekt0n/github-nvim-theme',
       lazy = false, -- make sure we load this during startup if it is your main colorscheme
       priority = 1000, -- make sure to load this before all the other start plugins
       config = function()
         require('github-theme').setup({
           -- ...
         })
         -- vim.cmd('colorscheme github_dark')
       end,
     },
     {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    { 
      "nvim-neotest/neotest",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-plenary"
      }
    }
})
