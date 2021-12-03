" Go to the beginning of the line in insert mode
inoremap <silent><C-a> <C-o>0
" Go to the ending of the line in insert mode
inoremap <silent><C-b> <C-o>$
" Paste from the system clipboard(in normal mode)
nnoremap <silent><leader>y "*y
" Paste from the system clipboard(in visual mode)
vnoremap <silent><leader>y "*y
" Cut from the system clipboard(in normal mode)
nnoremap <silent><leader>x "*x
" Cut from the system clipboard(in visual mode)
vnoremap <silent><leader>x "*x
" Paste from the system clipboard(in normal mode)
nnoremap <silent><leader>p "*p
" Paste from the system clipboard(in visual mode)
nnoremap <silent><leader>p "*p
" Select everything
nnoremap <silent><leader>a ggVG
" Delete a buffer
nnoremap <silent><leader>bd :bd<CR>
" Escape in terminal mode takes you to normal mode
" tnoremap <silent><leader><Esc> <C-\><C-n>
" Create a new blank buffer
nnoremap <leader>gg :enew<CR>
" Toggle search highlight
nnoremap <silent> <C-C> :if (&hlsearch == 1) \| set nohlsearch \| else \| set hlsearch \| endif<cr>
" Do not make Q go to ex-mode
nnoremap Q <Nop>

" Wrap selection with '' 
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
" Wrap selection with ""
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
" Wrap selection with ()
vnoremap <leader>( <esc>`>a)<esc>`<i(<esc>
" Wrap selection with []
vnoremap <leader>[ <esc>`>a]<esc>`<i[<esc>
" Wrap selection with {}
vnoremap <leader>{ <esc>`>a}<esc>`<i{<esc>

" These are all terminal shorthands
" I've made them to recognize common typos
cnoreabbrev wq wq
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev wqa1 wqa!
cnoreabbrev qa1 qa!
cnoreabbrev Qa qa
cnoreabbrev Wqa wqa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev B buffer
cnoreabbrev bcl BufferLineCloseLeft
cnoreabbrev bcr BufferLineCloseRight

" Change buffer sizes 
"
" Make uffer narrower
nnoremap <silent> <C-H> :vertical resize -4<CR>
" Make buffer wider
nnoremap <silent> <C-L> :vertical resize +4><CR>
" Make buffer shorter
nnoremap <silent> <C-J> :resize -4<CR>
" Make buffer longer
nnoremap <silent> <C-K> :resize +4<CR>

"Similar mappings for terminal mode{{{
tnoremap <Esc> <C-\><C-n>
tnoremap <silent> <C-H> :vertical resize -4<CR>
tnoremap <silent> <C-L> :vertical resize +4><CR>
tnoremap <silent> <C-J> :resize -4<CR>
tnoremap <silent> <C-K> :resize +4<CR>

" Create/Toggle a terminal to the bottom
nnoremap <silent><leader>` :call ChooseTerm("term-slider", 1)<CR>
" Create/Toggle a terminal in a buffer 
nnoremap <silent><leader><CR> :call ChooseTerm("term-pane", 0)<CR>

" Terminal Toggle
function! ChooseTerm(termname, slider)
    let pane = bufwinnr(a:termname)
    let buf = bufexists(a:termname)
    if pane > 0
        " pane is visible
        if a:slider > 0
            :exe pane . "wincmd c"
        else
            :exe "e #" 
        endif
    elseif buf > 0
        " buffer is not in pane
        if a:slider
            :exe "botright split"
        endif
        :exe "buffer " . a:termname
    else
        " buffer is not loaded, create
        if a:slider
            :exe "botright split"
        endif
        :terminal
        :exe "f " a:termname
    endif
endfunction

" Goto private config
nnoremap <silent><leader>dc :e ~/.config/nvim/lua/kyotorc/init.lua<CR>

" Telescope
" Fuzzy file finder
nnoremap <silent><leader>ff :Telescope find_files hidden=true<CR>
" Fuzzy buffer finder
nnoremap <silent><leader>fb :Telescope buffers<CR>
" Fuzzy help-tages finder
nnoremap <silent><leader>fh :Telescope help_tags<CR>
" Search with ripgrep
nnoremap <silent><leader>fi :Telescope live_grep<CR>
" Fuzzy git status
nnoremap <silent><leader>fg :Telescope git_status<CR>
" Fuzzy old-files finder
nnoremap <silent><leader>fo :Telescope oldfiles<CR>

" Open floating terminal
nnoremap <leader>to :lua require('lspsaga.floaterm').open_float_terminal()<CR>
" Close floating terminal
nnoremap <leader>tc :lua require('lspsaga.floaterm').close_float_terminal()<CR>

" Set recommended to false
"let g:coq_settings = { "keymap.recommended": v:false }

" Keybindings
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
" ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

" " compe completion
" " Use enter to select
" inoremap <silent><expr> <CR> compe#confirm('<CR>')
" " Close compe-completion popup
" inoremap <silent><expr> <C-e> compe#close('<C-e>')
" " Scroll down compe auto-docs
" inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })
" " Scroll up compe auto-docs
" inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })

" Lspsaga
" Symobols Finder
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
" Show code actions
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
" Show code actions for selection
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
" Show hovering documentation
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
" Scroll down in lspsaga menus
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" Scroll up in lspsaga menus
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
" Show signature help(imo not thaat useful)
nnoremap <silent> gs <cmd>lua require('lsopsaga.signaturehelp').signature_help()<CR>
" Rename symbols
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
" Preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
" Show suggestions/errors/warnings for the line
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
" Jump to the next diagnostic suggestion
nnoremap <silent> ]e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>
" Jump to the previous diagnostic suggestion
nnoremap <silent> [e <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>

" Jump to definition
nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>h :TroubleToggle<CR>
" Show symbols outline
nnoremap <silent><leader>so :SymbolsOutline<CR>
" Show blame for line
nnoremap <silent><leader>bb :Gitsigns toggle_current_line_blame<CR>

" Toggle comment for line
nnoremap <silent><leader>/ :Commentary<CR>
" Toggle comment for selections
vnoremap <silent><leader>/ :Commentary<CR>

function! ToggleNvimTree()
  if exists(":NvimTreeToggle") == 0
    " lazy load nvim-tree
    silent! packadd nvim-tree.lua
  endif

  NvimTreeToggle
endfunction

" Call nvim-tree lazy load function
nnoremap <silent> <leader>nn :call ToggleNvimTree()<CR>

"Open lazgit
nnoremap <silent> <leader>lg :LazyGit<CR>

" Wilder Search
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
" Wilder iterate through results
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

command LoadPacker lua require 'pluginList'
