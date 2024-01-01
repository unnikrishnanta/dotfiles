-- lspconfig {{

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
end

vim.keymap.set('n', '<leader>o', "<cmd>CHADopen<CR>")


-- Telescope keybindings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>ag', builtin.live_grep, {})
vim.keymap.set('n', '<leader>bf', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


-- Old keybindings yet to be ported.
vim.cmd([[

nnoremap <silent> <leader>w :update<CR>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>wq :w<CR>:q<CR>

nnoremap <silent> <leader>ag :Ag<CR>
nnoremap <silent> <leader>bf :Buffers<CR>
nnoremap <silent> <leader>f : call Fzf_dev()<CR>


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

tnoremap <C-w>h <C-\><C-n><C-w>h
tnoremap <C-w>j <C-\><C-n><C-w>j
tnoremap <C-w>k <C-\><C-n><C-w>k
tnoremap <C-w>l <C-\><C-n><C-w>l

nnoremap <CR> :noh<CR><CR>
nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

]])
