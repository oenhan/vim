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
Plug 'mhinz/vim-signify'

" vim列对齐线
Plug 'Yggdroot/indentLine'

"切换当前terminal和vim的鼠标焦点，F12
Plug 'nvie/vim-togglemouse'

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" 代码搜索配置插件 """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
" 快速跳转
Plug 'easymotion/vim-easymotion'

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

" 撤销记录列表
Plug 'mbbill/undotree'

" 括号补全
Plug 'tpope/vim-surround'

" 为buff自动创建不存在的目录
Plug 'pbrisbin/vim-mkdir'

" 快速补全
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe', {'do':'./install.py --clang-completer --go-completer'}


" 异步执行插件
Plug 'skywind3000/asyncrun.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""" 代码染色配置插件 """"""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'altercation/vim-colors-solarized'
Plug 'crusoexia/vim-monokai'

call plug#end()
