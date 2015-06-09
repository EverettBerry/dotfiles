let $HOME = $USERPROFILE
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/Vim/vimfiles/bundle/Vundle.vim
let path='~/Vim/vimfiles/bundle'
call vundle#begin(path)

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'morhetz/gruvbox'                  " retro color scheme
Plugin 'bling/vim-airline'                " pimped out powerline
Plugin 'scrooloose/nerdtree'                " directory structure
Plugin 'scrooloose/syntastic'               " syntax checker
Plugin 'altercation/vim-colors-solarized'   " color scheme
Plugin 'Lokaltog/vim-powerline'             " bottom file stats
Plugin 'tpope/vim-fugitive'                 " git in vim
Plugin 'nachumk/systemverilog.vim'          " system verilog 
Plugin 'tmhedberg/matchit'                  " html tag matching

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " detect filetype (python, js, etc.)

" solarized colorscheme
set t_Co=256
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
call togglebg#map("<F5>") " see README for details about this

" backspace button behaves normally
set backspace=indent,eol,start

" tab makes spaces (may need "set smarttab")
set et

" appropriate indentation based on file type
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd Filetype python setlocal shiftwidth=4 tabstop=4
autocmd Filetype html setlocal shiftwidth=2 tabstop=2
autocmd Filetype cpp setlocal shiftwidth=4 tabstop=4

" no "~" files
set noswapfile
set nobackup

" highlight found items on search
set hlsearch
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

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

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

" begin syntactic recommended settings
syntax enable
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" end syntactic recommended settings

" font (for windows)
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif
