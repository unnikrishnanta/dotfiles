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


