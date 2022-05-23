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
Plugin 'ycm-core/YouCompleteMe'

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

let &t_Co=256
set autoindent
set cindent
syntax on
colorscheme tammela

hi MatchParen cterm=bold ctermbg=none ctermfg=magenta

set autochdir
set shiftwidth=3
set softtabstop=3
set expandtab

set laststatus=2
set backspace=indent,eol,start

" change the leader key from "\" to ","
let mapleader=","

" toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>

" incremental search
set incsearch

let g:airline_theme='wombat'

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

set completeopt-=preview

" YCM mappings
nnoremap <leader>* :YcmCompleter GoToDefinition<CR>
nmap <leader>D <plug>(YCMHover)
