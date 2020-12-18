" Rayyan's vim configuration

" Uncomment to download vim-plug
"if empty(glob('~/.vim/autoload/plug.vim'))
"  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

" Use true colors if available
if has('termguicolors')
  set termguicolors
endif

" Set font
set guifont=Consolas:h30

" Polyglot python config
let g:polyglot_disabled = ['python', 'python-indent']
let g:polyglot_disabled = ['autoindent']

" Init Vim plugins 
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/rainbow_parentheses.vim'
"Plug 'sheerun/vim-polyglot'
Plug 'yggdroot/indentline'
Plug 'dense-analysis/ale'

call plug#end()
" NOTE: use ':PlugInstall' to use plugins

" Set compatibility to Vim only.
"set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Set colorscheme
"colo lightline

" Set cursorline highlighting
set cursorline

" Far affecting MacVim's bg when opened from terminal
set background=light

" For plug-ins to load correctly.
filetype on
filetype plugin on
filetype indent on

" Airline statusbar theme
let g:airline_theme='light'

" Turn on syntax highlighting.
syntax on

" Enable linting
" NOTE: toggle with `:ALEToggle`
let g:ale_linters={'clojure': ['clj-kondo']}

" Auto indent and spaces for tabs
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set cindent
inoremap { {<CR>}<up><end><CR>

" Don't indent when pasting
set pastetoggle=<f5>

" Turn off modelines
"set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Show line numbers
set number

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Not sure why but this is needed for status bar plugin
set laststatus=2

" Remove default status bar
set noshowmode

" Start NerdTree on 'vim'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Toggle NerdTree hotkey
map <C-t> :NERDTreeToggle<CR>

" Toggle Indent Guides
map <C-i> :IndentLinesToggle<CR>

" Enable Indent Guides on startup
let g:indent_guides_enable_on_vim_startup = 1

" Activate RainbowParens based on file type
augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

" Customize Raindbow Parens
let g:rainbow#max_level = 16
let g:rainbow#pairs = [['(', ')'], ['[', ']']]

" List of unwanted colors. ANSI code or #RRGGBB
let g:rainbow#blacklist = [233, 234]
