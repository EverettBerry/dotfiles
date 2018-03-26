" Reload .vimrc
" :so %
"
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
Plugin 'vim-airline/vim-airline'            " status lin-ubuntue
Plugin 'vim-airline/vim-airline-themes'            " status lin-ubuntue
Plugin 'scrooloose/nerdtree'                " directory structure
" Plugin 'scrooloose/syntastic'               " syntax checker
Plugin 'altercation/vim-colors-solarized'   " color scheme
Plugin 'ekalinin/Dockerfile.vim'            " Docker syntax
Plugin 'octol/vim-cpp-enhanced-highlight'   " better cpp highlighting
Plugin 'valloric/youcompleteme'             " autocomplete
Plugin 'szw/vim-tags'                       " ctags
Plugin 'ctrlpvim/ctrlp.vim'                 " fuzzy file, buffer, tag finder
Plugin 'rhysd/vim-crystal'                  " crystal language 
Plugin 'lepture/vim-jinja'                  " jinja templating language

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " detect filetype (python, js, etc.)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make sure to run python install.py --clang-completer
" If that fails, may need to upgrade to cmake 3.2 via a ppa 
" Set compiler flags appropriately for C/C++
let g:ycm_global_ycm_extra_conf = "~/dotfiles/ubuntu/.ycm_extra_conf.py"
let g:ycm_python_binary_path = '/usr/bin/python3'

let g:ycm_autoclose_preview_window_after_completion = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized Colorscheme (TODO: decouple terminal colors from vim)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
call togglebg#map("<F5>") " see README for details about this

" Set the vertical split color so it doesn't stand out
hi VertSplit ctermbg=black ctermfg=black


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab 
set autoindent

au FileType javascript setl shiftwidth=2 ts=2
au Filetype css setlocal shiftwidth=2 ts=2
au Filetype html setlocal shiftwidth=2 ts=2
au Filetype jinja setlocal shiftwidth=2 ts=2
au Filetype python setlocal shiftwidth=4 ts=4
let g:pyindent_open_paren = '&sw'

au Filetype cpp setlocal shiftwidth=4 ts=4
au Filetype c setlocal shiftwidth=4 ts=4
au Filetype yacc setlocal shiftwidth=4 ts=4
au Filetype lex setlocal shiftwidth=4 ts=4
au FileType make set noexpandtab shiftwidth=8 softtabstop=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Environment
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" allow mouse scrolling
set mouse=a

" accomodate the dark side
set fileformats+=dos

" damn you ~ files!!
set noswapfile
set nobackup

" remove delay switching to normal mode
set timeoutlen=1000 ttimeoutlen=0

" CtrlP mappings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP ' . $PERCEIVE_CODE
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=20
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$'
  \ }

" No line numbers
set nonumber

" Remove pipe characters in vertical bar
:set fillchars+=vert:\  


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

" solarized dark airline theme
let g:airline_theme='solarized'

" hide INSERT below status line
set noshowmode
