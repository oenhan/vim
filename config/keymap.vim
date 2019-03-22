"""""""""""""""""""""""""""""""""""""""""
" 快捷键配置
"""""""""""""""""""""""""""""""""""""""""
" 定义前缀键
let mapleader=";"

"定义快捷键到行首和行尾
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

" 水平窗口:sp
nmap wsp :sp<cr>
" 垂直窗口:vsp
nmap wvsp :vsp<cr>
" 遍历子窗口
nnoremap wn <C-W><C-W>

" 返回上一层
" Ctrl+o
" 返回下一层
" Ctrl+i

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

" w!! to sudo & write a file
cnoremap w!! call SudoSaveFile()
function! SudoSaveFile() abort
	execute (has('gui_running') ? '' : 'silent') 'write !env SUDO_EDITOR=tee sudo -e % >/dev/null'
	let &modified = v:shell_error
endfunction

" eggcache vim
:command! W w
:command! WQ wq
:command! Q q
:command! QA qa
:command! WQA wqa
