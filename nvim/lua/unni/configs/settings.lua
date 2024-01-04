local set = vim.opt


set.compatible = false
set.syntax = "on"
set.filetype = "on"
set.filetype.indent = "on"
set.filetype.plugin = "on"
set.autoindent = true
set.modeline = false -- disable modeline vulnerability

--  use 4 spaces for tabs
set.expandtab = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.shiftround = true
-- Open split windows to the right set splitright splitbelow
-- Yank to system clipboard
set.clipboard = "unnamed"
set.backspace = { "indent" , "eol", "start" }
set.hidden = true
set.laststatus = 2

-- Set linenumbers
set.number = true
set.relativenumber = true
set.wrap = true

-- column ruler at 80
set.ruler = true
set.colorcolumn = "80"
-- Wrap lines greater than 80
set.textwidth = 80
set.wrapmargin = 2

-- Highlight searching
set.incsearch = true
set.showmatch = true
set.hlsearch = true
set.ignorecase = true
set.smartcase = true
-- incsearch for the replace command
set.inccommand = "nosplit"

set.autoread = true -- autoread files
set.mouse = "a" -- use mouse for scroll or window size
-- save only current buffer when focus is lost

-- Use a global statusline
set.laststatus = 3


