"" custom configurations

" bundles configs
"
" Don't save hidden and unloaded buffers in sessions.
set sessionoptions-=buffers

" custom bundles configs
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" custom configs
"
" general
set noswapfile
set updatetime=100

" asyncomplete configs
" allow modifying the completeopt variable, or it will
" be overridden all the time
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

" NERDTree things
nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>nf :NERDTreeFind<cr>

" CtrlP path fuzzy test
nnoremap <silent> <leader>e :CtrlP<CR>
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_mruf_relative = 1




" go
au FileType go nmap <Leader>dh <Plug>(go-def)
au FileType go nmap <leader>tf :GoTestFunc<cr>
au FileType go let g:asyncomplete_auto_popup = 0
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_auto_type_info = 1
let g:go_auto_sameids = 0
let g:go_def_mapping_enabled = 0
let g:go_updatetime = 1500


"" rust
""au FileType rust let g:asyncomplete_auto_popup = 0
"autocmd User asyncomplete_setup call asyncomplete#register_source(
"    \ asyncomplete#sources#racer#get_source_options())

" python
let g:ale_fix_on_save = 1
let g:ale_linters = { 'python': [ 'flake8', 'pydocstyle', 'bandit', 'mypy' ] }
let g:ale_fixers = { 'python': [ 'black', 'isort','remove_trailing_lines', 'trim_whitespace' ]}
let g:ale_python_mypy_options = '--ignore-missing-imports'

" backup
set backup
set backupdir=~/.config/nvim/backup/
set writebackup
set backupcopy=yes
au BufWritePre * let &bex = '_' . strftime("%y%m%d-%Hh%Mm%S")

"fix a bug in new vim regex engine
set regexpengine=1

"test if lazyredraw is fast
set lazyredraw

"try new colors
set nocompatible " be iMproved, required
"filetype off " required
" set Vim-specific sequences for RGB colors
if v:version > 742
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

set background=dark

" compatible
"let g:coc_disable_startup_warning = 1

" set a default sql type to plug
let g:sql_type_default = 'pgsql'

" plugin: fzf some configs
nnoremap <silent> <Leader>f :Rg<CR>

let g:rehash256 = 1
colorscheme molokai

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <leader>gd <Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

""" Remap for format selected region
"vmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
"" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
