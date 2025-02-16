-- Source vimrc on updates
vim.cmd [[
    augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,init.vim so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
    augroup END
]]



-- highlight yanked text
vim.cmd(
    [[
        augroup highlight_yank
            autocmd!
            au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
        augroup END
    ]]
)


vim.fn.sign_define(
  'DiagnosticSignError',
  { text = '', texthl = 'LspDiagnosticsDefaultError' }
)

vim.fn.sign_define(
  'DiagnosticSignWarn',
  { text = '', texthl = 'LspDiagnosticsDefaultWarning' }
)

vim.fn.sign_define(
  'DiagnosticSignInfo',
  { text = '', texthl = 'LspDiagnosticsDefaultInformation' }
)

vim.fn.sign_define(
  'DiagnosticSignHint',
  { text = '', texthl = 'LspDiagnosticsDefaultHint' }
)

-- delete trailing whitespaces on BufWritePre
-- https://vi.stackexchange.com/a/37427/23752
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})



function fuzzyFindFiles()
  require('telescope.builtin').grep_string({
    path_display = { 'smart' },
    only_sort_text = true,
    word_match = "-w",
    search = '',
  })
end


--https://github.com/b0o/incline.nvim?tab=readme-ov-file#icon--filename
local helpers = require 'incline.helpers'
local devicons = require 'nvim-web-devicons'
require('incline').setup {
  window = {
    padding = 0,
    margin = { horizontal = 0 },
  },
  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
    if filename == '' then
      filename = '[No Name]'
    end
    local ft_icon, ft_color = devicons.get_icon_color(filename)
    local modified = vim.bo[props.buf].modified
    return {
      ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
      ' ',
      { filename, gui = modified and 'bold,italic' or 'bold' },
      ' ',
      guibg = '#44406e',
    }
  end,
}
