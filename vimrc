set nocompatible              " be iMproved, required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set autoindent
set cindent
colorscheme tammela
syntax on
hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

let g:ycm_show_diagnostics_ui = 0
let g:ycm_confirm_extra_conf = 0

set autochdir

set shiftwidth=3
set softtabstop=0
set expandtab

function Toggletab()
   if &expandtab
      echom "kernel's style"
      set shiftwidth=8
      set softtabstop=0
      set noexpandtab
   else
      echom "tammela's style"
      set shiftwidth=3
      set softtabstop=3
      set expandtab
   endif
endfunction
nmap <F9> mz:execute Toggletab()<CR>'z

set laststatus=2
set backspace=indent,eol,start

let g:airline_theme='simple'

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
