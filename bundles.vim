set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"------------------
" Code Completions
"------------------
Bundle 'Shougo/neocomplcache'
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'

"-----------------
" Fast navigation
"-----------------
Bundle 'easymotion/vim-easymotion'

"--------------
" Fast editing
"--------------
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjl/gundo.vim'
Bundle 'godlygeek/tabular'
Bundle 'nathanaelkane/vim-indent-guides'

Bundle 'pbrisbin/vim-mkdir'
Bundle 'danro/rename.vim'

"--------------
" IDE features
"--------------
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'


"for git cmdline 
Bundle 'tpope/vim-fugitive'

"cmdline format
Bundle 'Lokaltog/vim-powerline'

Bundle 'christoomey/vim-run-interactive'

"Bundle 'scrooloose/syntastic'
Bundle 'bronson/vim-trailing-whitespace'

Bundle 'mileszs/ack.vim'

Bundle 'vim-scripts/cscope.vim'
Bundle 'vim-scripts/ctags.vim'

"-------------
" Other Utils
"-------------
Bundle 'humiaozuzu/fcitx-status'
Bundle 'nvie/vim-togglemouse'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
Bundle 'vim-scripts/c.vim'
Bundle 'vim-scripts/a.vim'

"--------------
" Color Schemes
"--------------
Bundle 'altercation/vim-colors-solarized'
Bundle 'chriskempson/vim-tomorrow-theme'

filetype plugin indent on     " required!


