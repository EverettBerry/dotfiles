" Vundle code
" To run this, :PluginInstall
" or vim +PluginInstall +qall from command line
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'
" Plugin 'morhetz/gruvbox'
" Plugin 'bling/vim-airline'
" Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" backspace button behaves normally
set backspace=indent,eol,start

" spacing for vertica codebase
set softtabstop=4
set shiftwidth=4
set tabstop=4
set et
set smarttab
set st=4

set noswapfile

" highlight found items on search
set hlsearch
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
" file to store complex regexes for reference again
source ~/.regexlist.vim
set background=dark
" sublime text like colors
if !(&foldmethod == 'diff')
    colorscheme monokai 
endif

" syntax highlighting on
syntax on

" indent following python
filetype indent plugin on

" show line numbers
set number

" show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

map <C-n> :NERDTreeToggle<CR>
