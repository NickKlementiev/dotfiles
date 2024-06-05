" Turn off line numbers and start insert mode in terminal
autocmd TermOpen * setlocal nonumber norelativenumber | startinsert

" Set indenting for everything
autocmd Filetype * setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType lua,javascript,xml,typescript setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2
call wilder#enable_cmdline_enter()
call wilder#set_option('modes', ['/', '?'])
