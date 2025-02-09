return {
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = { "c", "lua", "vim", "python", "json", "git_config" },
          highlight = { enable = true },
          indent = { enable = true },
        })
      end
    },
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    { "RRethy/nvim-treesitter-textsubjects" }
  }