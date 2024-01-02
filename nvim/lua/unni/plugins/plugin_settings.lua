local chadtree_settings = {
    theme = {
        text_colour_set =  "nord",
        icon_glyph_set = "devicons"
    },
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)

require('lualine').setup {
  options = { theme  = 'iceberg_dark' },
}

-- https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#add-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

require('leap').create_default_mappings()


require("neotest").setup({
  adapters = {
    require("neotest-python")({
        -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
        dap = { justMyCode = false },
        args = {"--log-level", "DEBUG"},
        -- Runner to use. Will use pytest if available by default.
        runner = "pytest",
        python = "/Users/ukrishnan/miniconda3/bin/python",
    })
  }
})
