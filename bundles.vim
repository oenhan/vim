" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"------------------
" Code Completions
"------------------
Plugin 'Shougo/neocomplcache'
Plugin 'ervandew/supertab'

"-----------------
" Fast navigation
"-----------------
"页标签栏
Plugin 'humiaozuzu/TabBar'
".h快速切换
Plugin 'derekwyatt/vim-fswitch'
"代码标签
Plugin 'kshenoy/vim-signature'

"--------------
" Fast editing
"--------------
"括号补全
Plugin 'tpope/vim-surround'
Plugin 'sjl/gundo.vim'
Plugin 'nathanaelkane/vim-indent-guides'

"为buff自动创建不存在的目录
Plugin 'pbrisbin/vim-mkdir'
"重命名当前文件
Plugin 'danro/rename.vim'

"动态索引
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'

"--------------
" IDE features
"--------------
"ack-grep搜索
Plugin 'dyng/ctrlsf.vim'
"tagbar侧边栏
Plugin 'majutsushi/tagbar'
"工程目录栏
Plugin 'scrooloose/nerdtree'
"评论模板
Plugin 'scrooloose/nerdcommenter'
"代码模板
Plugin 'SirVer/ultisnips'
"快速文件搜索
Plugin 'kien/ctrlp.vim'

"for git cmdline
Plugin 'tpope/vim-fugitive'

"执行shell命令
Plugin 'christoomey/vim-run-interactive'
"前后空格显示告警色
Plugin 'bronson/vim-trailing-whitespace'

Plugin 'mileszs/ack.vim'
Plugin 'vim-scripts/cscope.vim'
Plugin 'vim-scripts/ctags.vim'

"-------------
" Other Utils
"-------------
Plugin 'humiaozuzu/fcitx-status'
"切换当前terminal和vim的鼠标焦点，F12
Plugin 'nvie/vim-togglemouse'

"----------------------------------------
" Syntax/Indent for language enhancement
"----------------------------------------
Plugin 'vim-scripts/c.vim'
Plugin 'vim-scripts/a.vim'

"--------------
" Color Schemes
"--------------
Plugin 'altercation/vim-colors-solarized'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'sickill/vim-monokai'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ptrr/phd-vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" 插件列表结束
call vundle#end()
filetype plugin indent on
