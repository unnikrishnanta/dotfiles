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

