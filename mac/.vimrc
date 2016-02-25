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
Plugin 'davidhalter/jedi-vim'               " better python auto complete
Plugin 'tpope/vim-fugitive'                 " git in vim
Plugin 'nachumk/systemverilog.vim'          " system verilog 
Plugin 'ekalini/Dockerfile.vim'             " Docker syntax
" Plugin 'mxw/vim-jsx'                        " For React
" JSX highlighting
" let g:jsx_ext_required = 0

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " detect filetype (python, js, etc.)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" turn these off if quickview is too annoying (looking at new projects)
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Python-mode Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:syntastic_python_python_exec = 'python3' " comment out for python 2
let g:pymode_rope = 0 " prefer jedi-mode for auto complete
" let g:syntastic_python_python_exec = '/usr/bin/python3' " python3 support

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" solarized colorscheme
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

" Set compiler flags appropriately for C/C++
" let g:ycm_global_ycm_extra_conf = "~/dotfiles/ubuntu/.ycm_extra_conf.py"
" let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }

" File navigator sidebar
map <C-n> :NERDTreeToggle<CR>

" '%%' in command mode expanded to file's directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mac specific 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
