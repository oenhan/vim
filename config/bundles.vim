call plug#begin('~/.vim/plugged')

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" IDE 界面配置插件 """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
" 目录进退
Plug 'justinmk/vim-dirvish'

" 底层状态条
Plug 'itchyny/lightline.vim'

" 前后空格显示告警色
Plug 'bronson/vim-trailing-whitespace'

" Git命令行
Plug 'tpope/vim-fugitive'

" vim列对齐线
Plug 'Yggdroot/indentLine'

"切换当前terminal和vim的鼠标焦点，F12
Plug 'nvie/vim-togglemouse'

"unimpaired 插件定义括号开头的快捷键，官方 Vim 中丢失的快捷键
Plug 'tpope/vim-unimpaired'

"控制VIM复制粘贴不带tab
Plug 'ConradIrwin/vim-bracketed-paste'

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" 代码搜索配置插件 """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
"模糊查找leaderf
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

" 自动后台更新ctags
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

"搜索栏预览
Plug 'skywind3000/vim-preview'

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" 代码格式配置插件 """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""

" 代码快速对齐
Plug 'junegunn/vim-easy-align'

" 自动进行tab2space转换
Plug 'vim-scripts/Smart-Tabs'

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" 代码编辑配置插件 """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
" 语法检查
Plug 'w0rp/ale'

" 强化具体语言文件
Plug 'vim-scripts/c.vim'
Plug 'vim-scripts/a.vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'fatih/vim-go'
Plug 'elzr/vim-json'

Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" 撤销记录列表
Plug 'mbbill/undotree'

" 括号补全
Plug 'tpope/vim-surround'

" 为buff自动创建不存在的目录
Plug 'pbrisbin/vim-mkdir'

" 快速补全
Plug 'Valloric/YouCompleteMe', {'do':'./install.py --clang-completer --go-completer'}
"函数参数提示
Plug 'Shougo/echodoc.vim'


" 异步执行插件
Plug 'skywind3000/asyncrun.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" 代码染色配置插件 """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'altercation/vim-colors-solarized'
Plug 'crusoexia/vim-monokai'

call plug#end()
