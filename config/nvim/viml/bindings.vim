" F3 and F4 for changing tabs
nnoremap <silent> <F2> :NvimTreeToggle<CR>
nnoremap <silent> <F3> :tabp<CR>
nnoremap <silent> <F4> :tabn<CR>

" Extra configuration for nvim-jdtls
"if has('nvim-0.5')
"    augroup lsp
"        au!
"        au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
"    augroup end
"endif
