require('lualine').setup {
  options = { theme  = 'nord' },
}


local chadtree_settings = {
    theme = {text_colour_set =  "nord"},
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
