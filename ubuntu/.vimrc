""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'                " directory structure
Plugin 'scrooloose/syntastic'               " syntax checker
Plugin 'altercation/vim-colors-solarized'   " color scheme
Plugin 'Lokaltog/vim-powerline'             " bottom file stats
Plugin 'klen/python-mode'                   " much python addons
Plugin 'tpope/vim-fugitive'                 " git in vim
Plugin 'nachumk/systemverilog.vim'          " system verilog 
Plugin 'ekalinin/Dockerfile.vim'            " Docker syntax
Plugin 'octol/vim-cpp-enhanced-highlight'   " better cpp highlighting
Plugin 'valloric/youcompleteme'             " autocomplete
Plugin 'szw/vim-tags'                       " ctags

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " detect filetype (python, js, etc.)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

let g:syntastic_ignore_files = ['\.py$']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set compiler flags appropriately for C/C++
let g:ycm_global_ycm_extra_conf = "~/dotfiles/ubuntu/.ycm_extra_conf.py"
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }
let g:ycm_autoclose_preview_window_after_completion = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-mode Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_options_max_line_length = 99

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

" Linting
let g:pymode_lint_checkers = ["pyflakes", ]
let g:pymode_lint = 1
let g:pymode_lint_write = 1
let g:pymode_lint_ignore = "E2, W"

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1

" Don't autofold code
let g:pymode_folding = 0

" Run code from vim
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
call togglebg#map("<F5>") " see README for details about this


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start

set expandtab
set smarttab 

au FileType javascript setl shiftwidth=2 ts=2
au Filetype css setlocal shiftwidth=2 ts=2
au Filetype html setlocal shiftwidth=2 ts=2
au Filetype python setlocal shiftwidth=4 ts=4

au Filetype cpp setlocal shiftwidth=4 ts=4
au Filetype c setlocal shiftwidth=4 ts=4
au Filetype yacc setlocal shiftwidth=4 ts=4
au Filetype lex setlocal shiftwidth=4 ts=4
au FileType make set noexpandtab shiftwidth=8 softtabstop=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Environment
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show line numbers
set number

" allow mouse scrolling
set mouse=a

" accomodate the dark side
set fileformats+=dos

" damn you ~ files!!
set noswapfile
set nobackup

" remove delay switching to normal mode
set timeoutlen=1000 ttimeoutlen=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight items found on search
set hlsearch
set laststatus=2

" File navigator sidebar
map <C-n> :NERDTreeToggle<CR>

" '%%' in command mode expanded to file's directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
