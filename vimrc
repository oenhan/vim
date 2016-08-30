""""""""""""""""""""""""""""""""""""""""""""""
" OENHAN'S VIM CONFIG
"
" Maintainer:	OenHan <oenhan#gmail.com>
" Last change:	2016-08-30
""""""""""""""""""""""""""""""""""""""""""""'"

source ~/.vim/bundles.vim

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

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
" yum install wmctrl
fun! ToggleFullscreen()
    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>
" 启动 vim 时自动全屏
autocmd VimEnter * call ToggleFullscreen()

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制, 不需要可以去掉
" 好处：误删什么的，如果以前屏幕打开，可以找回
set t_ti= t_te=

"""""""""""""""""""""""""""""""""""""""""
" 内容显示配置
"""""""""""""""""""""""""""""""""""""""""
" 开启代码颜色高亮
syntax on
syntax enable

" 告诉vim terminal支持 256 colors
set t_Co=256
" color scheme
set background=dark
color solarized
"color monokai
"colors Tomorrow-Night-Eighties
set guifont=Tsentsiu\ Mono\ HG\ 16

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

" 高亮特殊符号
"set backspace=indent,eol,start
"set list listchars=tab:»\ ,

" 开启行号显示
set number
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 显示行号
set number
" 不自动换行
set nowrap
" 终端滚动时时刻保留n行在界面中
set scrolloff=7

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
"set expandtab

" 根据侦测到的不同文件类型处理不同的插件和缩放
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType make setlocal noexpandtab

" 新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()"
" 定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "	> File Name: ".expand("%"))
        call append(line(".")+1, "	> Author: ")
        call append(line(".")+2, "	> Mail: ")
        call append(line(".")+3, "	> Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G

"""""""""""""""""""""""""""""""""""""""""
" 代码修改配置
"""""""""""""""""""""""""""""""""""""""""
" 让配置变更立即生效
autocmd BufWritePost .vimrc source %
" 文件修改之后自动载入
set autoread
" 取消备份
set nobackup
" 关闭交换文件
set noswapfile
" 提醒退出时保存文件
set confirm

"""""""""""""""""""""""""""""""""""""""""
" 快捷键配置
"""""""""""""""""""""""""""""""""""""""""
" 定义前缀键
let mapleader=";"

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $

" 定义git grep 快捷键
cnoreabbrev grep !git grep

" vim文本选择
" v : 按照字符选择
" V : 按行选择
" Ctrl+v : 按列选择

" 剪切到剪切板
nmap <Leader>d "+d
" 设置快捷键将选中文本块复制至系统剪贴板
nmap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p

" 遍历子窗口
nnoremap nw <C-W><C-W>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>
nmap <F3> :GundoToggle<cr>
nmap <F4> :IndentGuidesToggle<cr>
nmap <C-F11> :!cscope -bRq<cr>
nmap <C-F12> :!ctags -R --c-kinds=+l+x+p --fields=+lS -I __THROW,__nonnull --extra=+ .<cr>

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" w!! to sudo & write a file
cmap w!! %!sudo tee >/dev/null %

" eggcache vim
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

"""""""""""""""""""""""""""""""""""""""""
" 插件配置
"""""""""""""""""""""""""""""""""""""""""
" a.vim
" :A 跳到与当前.c同名的.h文件
nmap ha A
" :IH 跳到光标所在的单词对应的文件
nmap hi IH

" c.vim 默认不需要具体配置

" cscope.vim
if has('cscope')
    set cscopetag
    set csto=0
    set cscopeverbose

    cnoreabbrev csa cs add
    cnoreabbrev csf cs find
    cnoreabbrev csfs cs find s
    cnoreabbrev csfc cs find c
    cnoreabbrev csfe cs find e
    cnoreabbrev csft cs find t
    cnoreabbrev csfd cs find d
    cnoreabbrev csfi cs find i
    cnoreabbrev csfg cs find g
    cnoreabbrev csk cs kill
    cnoreabbrev csr cs reset
    cnoreabbrev css cs show
    cnoreabbrev csh cs help

    cnoreabbrev cs cs find s <cword>
    cnoreabbrev cc cs find c <cword>
    cnoreabbrev ce cs find e <cword>
    cnoreabbrev ct cs find t <cword>
    cnoreabbrev cd cs find d <cword>
    cnoreabbrev ci cs find i ^<cfile>$
    cnoreabbrev cg cs find g <cword>
    cnoreabbrev cf cs find f <cword>

    nnoremap <C-s>s :cs find s <cword><CR>
    nnoremap <C-s>g :cs find g <cword><CR>
    nnoremap <C-s>c :cs find c <cword><CR>
    nnoremap <C-s>t :cs find t <cword><CR>
    nnoremap <C-s>e :cs find e <cword><CR>
    nnoremap <C-s>f :cs find f <cfile><CR>
    nnoremap <C-s>i :cs find i ^<cfile>$<CR>
    nnoremap <C-s>d :cs find d <cword><CR>
endif

" ctags.vim
" ctags -R --c-kinds=+l+x+p --fields=+lS -I __THROW,__nonnull

" ctrlp.vim 快速文件查找
" 支持正则查询
let g:ctrlp_regexp = 1
let g:ctrlp_max_files = 0
" 过滤文件
set wildignore+="*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store"
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|o|mod.c)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

" 使用git index给搜索加速
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

" gundo.vim 调用 gundo 树
" u命令取消最近一次的操作，可以使用多次来恢复原有的操作
" U取消所有操作
" Ctrl+R可以恢复对使用u命令的操作
nnoremap <Leader>ud :GundoToggle<CR>
" 开启保存 undo 历史功能
set undofile
" undo 历史保存路径
set undodir=~/.undo_history/

" nerdtree
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=20
" 设置NERDTree子窗口位置
let NERDTreeWinPos="right"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeRespectWildIgnore=1
let NERDTreeMinimalUI=1

" Tagbar
" 设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_left=1
" 设置显示／隐藏标签列表子窗口的快捷键。速记：identifier list by tag
nnoremap <Leader>ilt :TagbarToggle<CR>
" 设置标签子窗口的宽度
let tagbar_width=32
" tagbar 子窗口中不显示冗余帮助信息
let g:tagbar_compact=1
" 自动聚焦
let g:tagbar_autofocus=1
let g:tagbar_iconchars = ['▸', '▾']
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0',
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" airline
let g:airline_theme='base16_solarized'
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_inactive_collapse=0
let g:airline_detect_spell=0
let g:airline_detect_crypt=1
"let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = '|'

" airline自有插件
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#vcs_priority = ["git"]
let g:airline#extensions#branch#format = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'

" 跳到具体的tab 使用 :b 1<CR>
nnoremap <C-Left> :bp<CR>
nnoremap <C-Right> :bn<CR>

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#capslock#enabled = 1

let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

let g:airline#extensions#quickfix#enabled = 1
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#quickfix#location_text = 'Location'

" indent_guides
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
let g:indent_guides_indent_levels = 10
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" vim-trailing-whitespace
cnoreabbrev fixws FixWhitespace

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
" 让Vim的补全菜单行为与一般IDE一致
set completeopt+=longest,menu
" 补全内容不以分割子窗口形式出现，只显示补全列表
"set completeopt-=preview
" YCM 补全菜单配色
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#D3D3D3 guibg=#005555
" YCM选中项配色
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#D3D3D3 guibg=#004444
" 设置在下面几种格式的文件上屏蔽ycm
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'nerdtree' : 1,
      \}

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1

" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1

" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 引入 C++ 标准库tags
"set tags+=/data/misc/software/misc./vim/stdcpp.tags

" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>

" Tab与空格之间进行转换
" Convert all leading spaces to tabs (default range is whole file):
" ---:Space2Tab
" Convert lines 11 to 15 only (inclusive):
" ---:11,15Space2Tab
" Convert last visually-selected lines:
" ---:'<,'>Space2Tab
" Same, converting leading tabs to spaces:
" ---:'<,'>Tab2Space
" Return indent (all whitespace at start of a line), converted from
" tabs to spaces if what = 1, or from spaces to tabs otherwise.
" When converting to tabs, result has no redundant spaces.
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

" Convert whitespace used for indenting (before first non-whitespace).
" what = 0 (convert spaces to tabs), or 1 (convert tabs to spaces).
" cols = string with number of columns per tab, or empty to use 'tabstop'.
" The cursor position is restored, but the cursor will be in a different
" column when the number of characters in the indent of the line is changed.
function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)



