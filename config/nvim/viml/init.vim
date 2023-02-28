" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
"runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1

" AutoPairs specific configurations
let g:AutoPairsCompatibleMaps = 0
let g:AutoPairsMapBS = 1

" Vim-Notes specific configurations
let g:notes_directories = ['~/Documents/Notes']
let g:notes_suffix = '.txt'
let g:notes_title_sync = 'no'

" Neovide specific configurations
let g:neovide_transparency = 0.85
let g:neovide_cursor_antialiasing = v:true

let g:notes_unicode_enabled = 1
let g:notes_smart_quotes = 1

"""Conquer of Completion configuration #BEGIN

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
" set cmdheight=2

" Setting GUI Font
set guifont=DejaVuSansMono\ Nerd\ Font\ Mono,DejaVu\ Sans\ Mono:h13
"set guifont=DejaVu\ Sans\ Mono:h13

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=no
endif

let g:coq_settings = { "keymap.recommended": v:true }

"" Use tab for trigger completion with characters ahead and navigate.
"" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" Use <c-space> to trigger completion.
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif
"
"" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
"" position. Coc only does snippet and additional edit on confirm.
"" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
"if exists('*complete_info')
"  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
"  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif
"
"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
"
"" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"
"" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction
"
"" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')
"
"" Symbol renaming.
"nmap <leader>rn <Plug>(coc-rename)
"
"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"
"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder.
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)
"
"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)
"
"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocAction('format')
"
"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
"" Add (Neo)Vim's native statusline support.
"" NOTE: Please see `:h coc-status` for integrations with external plugins that
"" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"
"" Mappings for CoCList
"" Show all diagnostics.
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"
"" coc-pairs force pairs between '<' and '>'
"autocmd Filetype jsx,tsx,ts,js,html let b:coc_pairs = [["<", ">"]]
"
"" coc-pairs on enter event
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"""Conquer of Completion configuration #END

" filetype specific configurations
filetype plugin indent on
" autocmd FileType html,css syntax on
" autocmd FileType html,css highlight Normal ctermbg=NONE guisp=Cyan

" LaTeX configuration
let g:livepreview_pdfviewer = 'evince'
let g:livepreview_engine = 'xelatex'
let g:livepreview_cursorhold_recompile = 0

let Tlist_Inc_Winwidth = 0

" vim-rainbow configurations
"let g:rainbow_active = 1
"
"let g:rainbow_load_separately = [
"    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
"    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
"    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
"    \ ]
"
"let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
"let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']
"
"autocmd Filetype c,cpp,objc,objcpp,python,javascript,typescript call rainbow#load()

" Personal sets
set number
set cursorline
set so=3
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set tabstop=4

""" Vim plugins
"
"call plug#begin('~/.vim/plugged')
"" Dracula color theme
"Plug 'dracula/vim',{'as':'dracula'}
"" LaTeX in vim
"Plug 'lervag/vimtex'
"" Rainbownize different set of parenthesis/square brackets/curly brackets
"Plug 'frazrepo/vim-rainbow'
"" Taglist for easier navigation throughout code
"Plug 'vim-scripts/taglist.vim'
"" Multiple cursors for multiple-line editing
"Plug 'terryma/vim-multiple-cursors'
"" Autopair symbols as ""/''/()/[]/{}
""Plug 'LunarWatcher/auto-pairs', {'tag': '*'}
"" Conquer of Completion (turns vim into VSCode)
""Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" Enable JSON comments
"Plug 'kevinoid/vim-jsonc'
"" Smart pasting indentation
"Plug 'sickill/vim-pasta'
"" Coloring tags
"Plug 'chrisbra/Colorizer'
"" JavaScript improved syntax highlighting
"Plug 'pangloss/vim-javascript'
"" JavaScript libraries syntax highlighting support
"Plug 'othree/javascript-libraries-syntax.vim'
"" Prettier
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"" Git plugin
"Plug 'tpope/vim-fugitive'
"" Vim-Notes plugin
""Plug 'xolox/vim-misc'
""Plug 'xolox/vim-notes'
"call plug#end()

" React specific configurations
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx

" Neovim Dracula theme
"colorscheme dracula
syntax on
hi Normal ctermbg=NONE guisp=Cyan

" Specific shortcuts
nnoremap <silent> <F2> :BufferLinePickClose<CR>
nnoremap <silent> <F3> :BufferLineCyclePrev<CR>
nnoremap <silent> <leader><F3> :BufferLineMovePrev<CR>
nnoremap <silent> <F4> :BufferLineCycleNext<CR>
nnoremap <silent> <leader><F4> :BufferLineMoveNext<CR>
nnoremap <silent> <F5> :BufferLinePick<CR>
nnoremap <silent> <F8> :TlistToggle<CR>
nnoremap <silent> <F7> :ColorToggle<CR>
nnoremap <silent> <F6> :Prettier<CR>
nnoremap <silent> <esc> :noh<return><esc>



" Colon or semicolon at the end of the line when inserting [$+;] or [$+,]
" inoremap <silent> <M-z> <esc>m`A;<esc>``a
" inoremap <silent> <M-x> <esc>m`A,<esc>``a

" coq-nvim substitution of target in insert mode
inoremap <silent> <C-s> <esc><C-h>

" Prevent clipboard clearing on exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))
