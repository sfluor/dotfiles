" -----------------
" Begin of vim-plug config
" -----------------
if &compatible
 set nocompatible
endif

if !empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    call plug#begin()
    Plug 'Raimondi/delimitMate'
    Plug 'SirVer/ultisnips'
    Plug 'airblade/vim-gitgutter'
    Plug 'chriskempson/base16-vim'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'ervandew/supertab'
    if executable("go")
        Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    endif
    Plug 'honza/vim-snippets'
    Plug 'itchyny/lightline.vim'
    Plug 'junegunn/fzf', { 'do': './install --all', 'merged': 0 }
    Plug 'junegunn/fzf.vim'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'rhysd/vim-clang-format'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    call plug#end()
endif

" -----------------
" End of vim-plug config
" -----------------


" -----------------
" General settings
" -----------------
" Display number
set number

" Syntax highlighting
filetype plugin indent on
syntax enable
set nocursorcolumn

" Keep buffers hidden when not used
set hidden

" Intuitive line moves
noremap j gj
noremap k gk

" Use utf8
set encoding=utf8
set fileencoding=utf8

" Enable filetype plugins
filetype plugin on
filetype indent on

" Update if file is modificated outside vim
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" autoindent
set autoindent

if has("nvim")
    set inccommand=split
endif

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Set incremental search
set incsearch

" Set smartcase for search
set ignorecase
set smartcase

" Command line wild menu for completion
set wildmenu
set wildignore=*.o,*~,*.pyc

" Show matching brackets/braces
set showmatch

" Enable backspace
set backspace=2

" Enable scrolling
set mouse=a

" Update time for git gutters
set updatetime=100

" Do not create swap files or backup files
set nobackup
set nowritebackup
set noswapfile

" Color scheme
" Enable true color support
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
  set termguicolors
endif
try
    colorscheme base16-snazzy
catch
    colorscheme slate
endtry

hi Normal guibg=NONE ctermbg=NONE
let g:enable_italic_font = 1

" Keep cursor at the center
set scrolloff=9999

" Center after goto search result
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Disable lines in terminal window
if has("nvim")
    augroup TerminalStuff
        " Clear old autocommands
        autocmd!
        autocmd TermOpen * setlocal nonumber norelativenumber
    augroup END
endif

" Avoid replacing current clipboard when pasting over
xnoremap p pgvy

" Line numbers colors
set cursorline
highlight LineNr guifg=#78787e guibg=$BACKGROUND
highlight CursorLine guibg=$BACKGROUND
highlight CursorLineNr guifg=$WHITE guibg=$WHITE

" -----------------
" Shortcuts
" -----------------

nnoremap cd :cd<space>

nnoremap <Space> :noh<CR>

" Exit insert mod quickly
" inoremap jk <esc>

" Uppercase current word in insert mode
inoremap <C-u> <esc>viwUi

" Shortcut to replace last search
noremap <leader>r :%s///gc<left><left><left>

" Fzf shortcuts
" Word under cursor
noremap <leader>c :Ag <c-r><c-w><cr>
nnoremap <leader>a :call fzf#vim#ag('', fzf#vim#with_preview('right'))<CR>
nnoremap <leader>f :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>
nnoremap <leader>b :Buffers<CR>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Set clipboard to the system one
set clipboard+=unnamedplus
"let g:loaded_clipboard_provider = 1

" Sudo write in case of permission denied
command! W w !sudo tee % > /dev/null

" Jump to Buffer utility
nnoremap gb :ls<CR>:b<Space>

" -----------------
" Languages
" -----------------

" Go settings
augroup go_file
    autocmd!
    let g:go_fmt_command = "goimports"
    let g:go_highlight_types = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_generate_tags = 1
    let g:go_auto_type_info = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_operators = 1
    let g:go_metalinter_autosave = 1
    let g:go_metalinter_autosave_enabled = ['vet', 'golint']
    au FileType go nmap <leader>o <Plug>(go-doc)
    au FileType go nmap <leader>in <Plug>(go-info)
augroup END

" C settings
augroup c_file
    autocmd!
    let g:clang_format#code_style = "webkit"
    let g:clang_format#style_options = {"BreakBeforeBraces" : "Attach"}
    autocmd BufWritePre *.c,*.h ClangFormat
augroup END

" -----------------
" Plugins configuration
" -----------------

" lightline
set noshowmode
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'env',
    \ 'component_function': {
          \   'gitbranch': 'fugitive#head',
    \ },
    \ }

let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste'],
    \           [ 'gitbranch', 'readonly', 'relativepath', 'modified' ],
    \           ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'filetype' ] ]
    \ }

let g:lightline.inactive = g:lightline.active
let g:lightline.mode_map = {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'L',
    \ "\<C-v>": 'B',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'S-LINE',
    \ "\<C-s>": 'S-BLOCK',
    \ 't': 'T',
    \ }

" Netrw config
let g:netrw_liststyle = 3

" FZF settings
nnoremap <C-p> :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

let $FZF_DEFAULT_OPTS='--layout=reverse'

" custom fzf floating preview
let g:fzf_layout = { 'window': 'call FloatingFZF()' }
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let max_height = &lines
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': max_height / 5,
        \ 'col': col,
        \ 'width': width,
        \ 'height': 3 * max_height / 5
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
" no background on fzf preview
au FileType fzf set nonu nornu
highlight NormalFloat cterm=NONE ctermfg=14 ctermbg=0 gui=NONE

" Ulti-snippets
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
