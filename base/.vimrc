
filetype plugin on

syntax on
highlight Statement term=bold cterm=bold ctermfg=DarkCyan
set ts=2 sw=2
set showmatch
set ruler
set smarttab

set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'dag/vim-fish'

filetype plugin indent on
