set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugin 'morhetz/gruvbox'                  " retro color scheme
" Plugin 'bling/vim-airline'                " pimped out powerline
Plugin 'scrooloose/nerdtree'                " directory structure
Plugin 'scrooloose/syntastic'               " syntax checker
Plugin 'altercation/vim-colors-solarized'   " color scheme
Plugin 'Lokaltog/vim-powerline'             " bottom file stats
Plugin 'klen/python-mode'                   " much python addons
Plugin 'davidhalter/jedi-vim'               " better python auto complete
Plugin 'tpope/vim-fugitive'                 " git in vim
Plugin 'nachumk/systemverilog.vim'          " system verilog 
Plugin 'ekalinin/Dockerfile.vim'            " Docker syntax
Plugin 'octol/vim-cpp-enhanced-highlight'   " better cpp highlighting

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " detect filetype (python, js, etc.)

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" solarized colorscheme
set t_Co=256
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
call togglebg#map("<F5>") " see README for details about this

" backspace button behaves normally
set backspace=indent,eol,start

" damn you ~ files!!
set noswapfile
set nobackup

"tab makes spaces (may need "set smarttab")
set et

" appropriate indentation based on file type
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd Filetype python setlocal shiftwidth=4 tabstop=4
autocmd Filetype html setlocal shiftwidth=2 tabstop=2
autocmd Filetype cpp setlocal shiftwidth=4 tabstop=4
autocmd Filetype c setlocal shiftwidth=4 tabstop=4
autocmd Filetype yacc setlocal shiftwidth=4 tabstop=4
autocmd Filetype lex setlocal shiftwidth=4 tabstop=4
autocmd Filetype css setlocal shiftwidth=2 tabstop=2
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

" highlight items found on search
set hlsearch
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" show line numbers
set number

" allow mouse scrolling
set mouse=a

" accomodate the dark side
set fileformats+=dos

" show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

map <C-n> :NERDTreeToggle<CR>

" begin syntactic recommended settings
syntax enable
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" turn these off if quickview is too annoying (looking at new projects)
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" end syntactic recommended settings


" begin python-mode settings
" taken from: http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
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
" end python mode settings

" Vim tips
" * Use Ctrl-] to follow links in help
