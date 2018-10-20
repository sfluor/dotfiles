" -----------------
" Begin of vim-plug config
" -----------------
if &compatible
 set nocompatible
endif

call plug#begin()
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/deoplete.nvim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'zchee/deoplete-go', {'do': 'make'}
Plug 'zchee/deoplete-jedi'
Plug 'davidhalter/jedi-vim'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/deol.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'prettier/vim-prettier'
Plug 'styled-components/vim-styled-components'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': './install --all', 'merged': 0 }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'ntpeters/vim-better-whitespace'
Plug 'ervandew/supertab'
Plug 'w0rp/ale'
call plug#end()

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
set nocursorline

" Keep buffers hidden when not used
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" Intuitive line moves
noremap j gj
noremap k gk

" Syntax highlighting
syntax on

" Use utf8
set encoding=utf8

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
  set term=xterm-256color
endif
colorscheme base16-snazzy
let g:enable_italic_font = 1

" Show context after search
set scrolloff=10

" Center after goto search result
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Disable lines in terminal window
augroup TerminalStuff
    " Clear old autocommands
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" -----------------
" Shortcuts
" -----------------

nnoremap <Space> :noh<CR>

" Exit insert mod quickly
inoremap jk <esc>

" Edit vimrc shortcut
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source vimrc shortcut
nnoremap <leader>sv :source $MYVIMRC<cr>

" Uppercase current word in insert mode
inoremap <C-u> <esc>viwUi

" Shortcut to replace last search
noremap <leader>r :%s///gc<left><left><left>

" Fzf shortcuts
nnoremap <leader>a :call fzf#vim#ag('', fzf#vim#with_preview('right'))<CR>
nnoremap <leader>f :call fzf#vim#files('', fzf#vim#with_preview('right'))<CR>
nnoremap <leader>b :Buffers<CR>

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Shortcut to open terminal
nmap <leader>t :terminal<CR>

" Remap escape key for terminal and navigation keys
if has("nvim")
    tnoremap <Esc> <C-\><C-n>
    tnoremap jk <C-\><C-n>
endif

" Shortcut to copy to clipboard
vmap <leader>y "+y

" Shortcut to open netrw
noremap <leader>p :Explore<CR>

" Fast saving
nmap <leader>w :w!<CR>

" Sudo write in case of permission denied
command! W w !sudo tee % > /dev/null

" Jump to Buffer utility
nnoremap gb :ls<CR>:b<Space>

" Search current selection
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

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
    au FileType go nmap <leader>o <Plug>(go-doc)
    au FileType go nmap <leader>in <Plug>(go-info)
augroup END

" JS settings
augroup js_file
    autocmd!
    autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
    " prettier
    let g:prettier#autoformat = 0
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync
augroup END

" Python settings
augroup py_file
    autocmd!
    " autocmd BufWritePost *.py execute ':Black'
augroup END

" -----------------
" Plugins configuration
" -----------------

" lightline
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Sneak
let g:sneak#label = 1
nmap <leader><leader> <Plug>Sneak_,

" Netrw config
let g:netrw_liststyle = 3

" FZF settings
nnoremap <C-p> :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Enable deoplete
let g:deoplete#enable_at_startup = 1

" Deoplete Close autopreview after completion
augroup autocomplete
    autocmd!
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

" Ulti-snippets
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
