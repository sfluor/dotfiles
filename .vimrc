" -----------------
" Begin of dein config
" -----------------
if &compatible
 set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('mileszs/ack.vim')
 call dein#add('Shougo/deoplete.nvim')
 call dein#add('vim-airline/vim-airline')
 call dein#add('fatih/vim-go')
 call dein#add('posva/vim-vue')
 call dein#add('mxw/vim-jsx')
 call dein#add('tpope/vim-commentary')
 call dein#add('tpope/vim-fugitive')
 call dein#add('vim-airline/vim-airline-themes')
 call dein#add('zchee/deoplete-go', {'build': 'make'})
 call dein#add('davidhalter/jedi-vim')
 call dein#add('airblade/vim-gitgutter')
 call dein#add('Shougo/deol.nvim')
 call dein#add('SirVer/ultisnips')
 call dein#add('honza/vim-snippets')
 call dein#add('Raimondi/delimitMate')
 call dein#add('sheerun/vim-polyglot')
 call dein#add('mhinz/vim-startify')
 call dein#add('ambv/black')
 call dein#add('majutsushi/tagbar')
 call dein#add('ryanoasis/vim-devicons')
 call dein#add('prettier/vim-prettier')
 call dein#add('terryma/vim-multiple-cursors')
 call dein#add('styled-components/vim-styled-components')
 call dein#add('ayu-theme/ayu-vim')
 call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
 call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
 call dein#add('easymotion/vim-easymotion')
 call dein#add('tpope/vim-surround')
 call dein#add('ntpeters/vim-better-whitespace')

 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif
 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable
" -----------------
" End of dein config
" -----------------


" -----------------
" General settings
" -----------------
" Display line number
set number

" Keep buffers hidden when not used
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

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
set termguicolors     " enable true colors support
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu
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

" -----------------
" Shortcuts
" -----------------

" Shortcut to replace last search
noremap <leader>r :%s///gc<left><left><left>

" Startify shortcut
noremap <leader>s :Startify<CR>

" Ack shortcut
map <leader>a :Ack<space>

" Center screen
nnoremap <space> zz

" Git shortcuts
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit -m
map <leader>gpur :Gpull
map <leader>gpus :Gpush

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Shortcut to open deol terminal
nmap <leader>t :Deol<CR>

" Shortcut to copy to clipboard
vmap <leader>y "+y

" Shortcut to open tagbar
nmap <leader>b :TagbarToggle<CR>

" Shortcut to navigate through windows
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
" Fast saving
nmap <leader>w :w!<CR>

" Sudo write in case of permission denied
command W w !sudo tee % > /dev/null

" Jump to Buffer utility
nnoremap gb :ls<CR>:b<Space>

" Map ESC to exit key for deol terminal
tnoremap <ESC> <C-\><C-n>:q!<CR>:bd bin/zsh<CR>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<CR>

" Search current selection
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

" -----------------
" Languages
" -----------------

" Go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" JS settings
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
" prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Python settings
autocmd BufWritePost *.py execute ':Black'

" -----------------
" Plugins configuration
" -----------------

" FZF settings
let g:fzf_layout = { 'down': '~20%' }
nnoremap <leader>$ :Tags<CR>
nnoremap <C-p> :GFiles<CR>

" Enable deoplete
let g:deoplete#enable_at_startup = 1

" Deoplete Close autopreview after completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Ulti-snippets
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Powerline font for the airline module
let g:airline_powerline_fonts=1
