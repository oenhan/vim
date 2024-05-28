"""""""""""""""""""""""""""""""""""""""""
" 基本配置
"""""""""""""""""""""""""""""""""""""""""
" 启动的时候不显示那个援助乌干达儿童的提示
set shortmess=atI

" 解码
set encoding=utf-8
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" 关闭兼容模式
set nocompatible
" 历史记录控制
set history=1000

"""""""""""""""""""""""""""""""""""""""""
" vim控制配置
"""""""""""""""""""""""""""""""""""""""""
" 使用鼠标模式
set mouse=a
" 在title bar显示文件名
set title
" 总是显示状态栏
set laststatus=2
" 在状态栏显示命令行
set showcmd

" 显示光标当前位置
set ruler
" 禁止光标闪烁
set gcr=a:block-blinkon0

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

" 配置clipboard
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""
" 内容显示配置
"""""""""""""""""""""""""""""""""""""""""
" 开启代码颜色高亮
syntax on
syntax enable

" support 256 colors
set t_Co=256

" support true color
if has("termguicolors")
    set termguicolors
endif

" color scheme
set background=dark
color onedark

"""""""""""""""""""""""""""""""""""""""""
" 代码查看配置
"""""""""""""""""""""""""""""""""""""""""
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase

" vim 自身命令行模式智能补全
set wildmenu
set smartcase
set showmatch
set matchtime=2

" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch
" 不自动换行
set nowrap
" 终端滚动时时刻保留n行在界面中
set scrolloff=25

" 高亮特殊符
"set backspace=indent,eol,start
"set list
"if has('multi_byte') && &encoding ==# 'utf-8'
"  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
"else
"  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
"endif

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 默认收缩设置
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab

" 根据侦测到的不同文件类型处理不同的插件和缩放
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0 wrap
autocmd FileType make setlocal noexpandtab
autocmd FileType c,h,cpp,c++ setlocal noexpandtab
autocmd FileType sh setlocal textwidth=0 wrap

"""""""""""""""""""""""""""""""""""""""""
" 代码修改配置
"""""""""""""""""""""""""""""""""""""""""
" 让配置变更立即生效
autocmd! BufWritePost $HOME/.vimrc source %
" 在另外一个vim中加载被修改过的vimrc
cnoreabbrev vimreload so $HOME/.vimrc

" 文件修改之后自动载入
set autoread
" 提醒退出时保存文件
set confirm
