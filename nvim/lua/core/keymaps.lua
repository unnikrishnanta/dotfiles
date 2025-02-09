-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
      -- Enable completion triggered by <c-x><c-o>
      vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      -- Buffer local mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local opts = { buffer = ev.buf }
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
      vim.keymap.set('n', '<C-d>', vim.lsp.buf.signature_help, opts)

      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>fm', function()
        vim.lsp.buf.format { async = true }
      end, opts)
      vim.keymap.set('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)

      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)

      vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    end,
  })

  -- open file_browser with the path of the current buffer
  vim.api.nvim_set_keymap(
    "n",
    "<leader>o",
    ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
    { noremap = true }
  )

  -- NvimTreeToggle
  -- vim.keymap.set('n', '<leader>fs', require "nvim-tree.api".tree.toggle, {})
  vim.keymap.set('n', '<leader>fs', require "oil".toggle_float, {})
  -- Mimic vim-vinegar method of navigating to the parent directory
  vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


  -- Telescope keybindings
  local builtin = require('telescope.builtin')
  vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
  vim.keymap.set('n', '<leader>km', builtin.keymaps, {})
  vim.keymap.set('n', '<leader>ag', '<cmd>lua fuzzyFindFiles{}<cr>', {})
  vim.keymap.set('n', '<leader>bf', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  vim.keymap.set('n', '<leader>ag', '<cmd>lua fuzzyFindFiles{}<cr>', {})


  -- Neotest keybindings
  vim.keymap.set('n', '<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%")) <cr>' , {})
  vim.keymap.set('n', '<leader>tr', '<cmd>lua require("neotest").run.run() <CR>' , {})
  vim.keymap.set('n', '<leader>to', '<cmd>lua require("neotest").output.open({ enter = true, short = false })<cr>' , {})
  vim.keymap.set('n', '<leader>tx', '<cmd>lua require("neotest").run.stop() <cr>' , {})
  vim.keymap.set('n', '<leader>ts', '<cmd>lua require("neotest").summary.toggle() <cr>' , {})



  -- trouble.nvim
  -- vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
  -- vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
  -- vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
  -- vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
  -- vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
  vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)



  local ls = require'luasnip'
  vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
  vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
  vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

  vim.keymap.set({"i", "s"}, "<C-E>", function()
      if ls.choice_active() then
          ls.change_choice(1)
      end
  end, {silent = true})


  vim.keymap.set({'n', 'x', 'o'}, '<leader>lp', '<Plug>(leap-forward)')
  vim.keymap.set({'n', 'x', 'o'}, '<leader>Lp', '<Plug>(leap-backward)')


  -- substitute keybindings
  vim.keymap.set("n", "s", require('substitute').operator, { noremap = true })
  vim.keymap.set("n", "ss", require('substitute').line, { noremap = true })
  vim.keymap.set("x", "s", require('substitute').visual, { noremap = true })


  vim.keymap.set({"n", "x"}, '<leader>ds', function() require('notify').dismiss() end)


  -- https://github.com/Almo7aya/openingh.nvim
  -- for repository page
  vim.api.nvim_set_keymap("n", "<Leader>gor", ":OpenInGHRepo <CR>", { silent = true, noremap = true })
  -- for current file page
  vim.api.nvim_set_keymap("n", "<Leader>gof", ":OpenInGHFile <CR>", { silent = true, noremap = true })
  vim.api.nvim_set_keymap("n", "<Leader>gol", ":OpenInGHFileLines <CR>", { silent = true, noremap = true })

  -- Disable the use of arrow keys
  vim.cmd([[
  nnoremap <Left>  <Nop>
  nnoremap <Right> <Nop>
  nnoremap <Up>    <Nop>
  nnoremap <Down>  <Nop>
  " inoremap <Left>  <ESC>:echoe "Use h"<CR>
  " inoremap <Right> <ESC>:echoe "Use l"<CR>
  " inoremap <Up>    <ESC>:echoe "Use k"<CR>
  " inoremap <Down>  <ESC>:echoe "Use j"<CR>
  ]])

  -- Old keybindings yet to be ported.
  vim.cmd([[


  nnoremap <silent> <leader>w :update<CR>
  nnoremap <silent> <leader>q :q<CR>
  nnoremap <silent> <leader>wq :w<CR>:q<CR>


  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>

  tnoremap <C-w>h <C-\><C-n><C-w>h
  tnoremap <C-w>j <C-\><C-n><C-w>j
  tnoremap <C-w>k <C-\><C-n><C-w>k
  tnoremap <C-w>l <C-\><C-n><C-w>l

  nnoremap <S-Up> <C-w>+
  nnoremap <S-Down> <C-w>-
  nnoremap <S-Right> <C-w>>
  nnoremap <S-Left> <C-w><


  nnoremap <CR> :noh<CR><CR>
  nnoremap S :keeppatterns substitute/\s*\%#\s*/\r/e <bar> normal! ==<CR>

  vnoremap <leader>gs "hy:%s/<C-r>h//gc<left><left><left>

  ]])

