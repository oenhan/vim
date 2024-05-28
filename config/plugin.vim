"""""""""""""""""""""""""""""""""""""""""
" 插件配置
"""""""""""""""""""""""""""""""""""""""""
"https://en.wikipedia.org/wiki/List_of_Unicode_characters

" ----------a.vim插件配置-----------------------------------------------
" :A 跳到与当前.c同名的.h文件
nmap ha A
" :IH 跳到光标所在的单词对应的文件
nmap hi IH

" 复制粘贴
"let g:system_copy_enable_osc52 = 1
let g:system_copy_silent = 1
"let g:system_copy#copy_command='xclip -sel clipboard'
"let g:system_copy#paste_command='xclip -sel clipboard -o'

"----------vim-preview配置-------------------------------------------------
"P 预览 大p关闭
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>

"----------autoformat格式化工具配置---------------------------
" 需要安装astyle，yapf和shfmt
noremap <F3> :Autoformat<CR>

" 选择下一个格式化工具 :NextFormatter and :PreviousFormatter
" 查看当前的格式化工具 :CurrentFormatter

let g:autoformat_autoindent = 1
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 1

" 自定义格式化命令
let g:formatters_c = "'astyle --mode=c --style=allman '"
let g:formatters_h = '"astyle --mode=c --style=allman" '

let g:formatters_cpp = "'astyle --style=google' "
let g:formatters_hpp = "'astyle --style=google' "

"----------------echodoc.vim 配置--------------------------
set noshowmode

" -----------LeaderF 模糊文件查找-------------------------------
" <C-R>    : 在模糊查询和正则表达式模式间切换
" <C-F>    : 在全路径搜索和名字搜索模式间切换
" <Tab>    : 切换成normal模式
" <F5>     : 刷新缓存
" <C-Up>   : 在预览popup窗口里滚动向上
" <C-Down> : 在预览popup窗口里滚动向下

let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WindowHeight = 0.30
let g:Lf_ShowRelativePath = 0
let g:Lf_ShowDevIcons = 0

let g:Lf_DefaultExternalTool='rg'
"let g:Lf_WindowPosition = 'popup'
let g:Lf_WorkingDirectoryMode = 'AF'
let g:Lf_CacheDirectory = expand('~/.cache')
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.root','MAINTAINERS', 'COPYING','.project']

let g:Lf_WildIgnore = {
  \ 'dir': ['.git', '__pycache__', '.DS_Store', '*_cache'],
  \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
  \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
  \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
  \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf',
  \ '*.mp3', '*.aac']
  \}

let g:Lf_PreviewResult = {
        \ 'File': 0,
        \ 'Buffer': 0,
        \ 'Mru': 0,
        \ 'Tag': 0,
        \ 'BufTag': 1,
        \ 'Function': 1,
        \ 'Line': 1,
        \ 'Colorscheme': 0,
        \ 'Rg': 0,
        \ 'Gtags': 0
        \}

let g:Lf_ShortcutF = '<c-p>'
" navigate functions or methods in the buffer
noremap <leader>ff :<C-U><C-R>=printf("Leaderf function %s", "")<CR><CR>
" Search tags in current buffer
nnoremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
" search a line in the buffer
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
" search buffers
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
" search most recently used files
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
" Search vim help files
nnoremap <leader>fh :<C-U><C-R>=printf("Leaderf help %s", "")<CR><CR>


let g:Lf_RgConfig = [
        \ "--max-columns=150",
        \ "--type-add web:*.{html,css,js}*",
        \ "--glob=!git/*",
        \ "--hidden"
    \ ]

noremap <leader>fs :<C-U><C-R>=printf("Leaderf rg --live %s", "")<CR><CR>
" search word under cursor, the pattern is treated as regex
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search word under cursor literally only in current buffer
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
" append the result to previous search results.
noremap <C-G> :<C-U><C-R>=printf("Leaderf! rg --append -e %s ", expand("<cword>"))<CR>

let g:Lf_Global = '/usr/bin/global'
let g:Lf_Gtags = '/usr/bin/gtags'
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_GtagsAutoUpdate = 0
let g:Lf_GtagsSource = 1
let g:Lf_Gtagsconf = expand('/etc/gtags/gtags.conf')
let g:Lf_Gtagslabel = 'native-pygments'

noremap <leader>fg :<C-U><C-R>=printf("Leaderf gtags %s", "")<CR><CR>
noremap <leader>fu :<C-U><C-R>=printf("Leaderf! gtags --update")<CR><CR>

" search current word
"noremap <leader>fs :<C-U><C-R>=printf("Leaderf! gtags -s %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>

"-----------------------coc.nvim----------------------------------------------
let g:coc_config_home = '~/.vim/config/coc-settings.json'
let g:coc_global_extensions = [ 'coc-lists', 'coc-highlight', 'coc-clangd', 'coc-rust-analyzer', 'coc-json' ]

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

nmap <leader>gc :call CocActionAsync('showIncomingCalls')<CR>
nmap <leader>gt :call CocActionAsync('showSuperTypes')<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Show all diagnostics
nnoremap <silent><nowait> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>


"-----------------------vim-auto-popmenu--------------------------------------
" 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}

" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
set cpt=.,k,w,b

" 不要自动选中第一个选项。
set completeopt=menu,menuone,noselect

" 禁止在下方显示一些啰嗦的提示
set shortmess+=c

"----------asyncrun.vim插件配置--------------------------------------------
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" 设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

"----------undo插件配置-------------------------------------------------
" u命令取消最近一次的操作，可以使用多次来恢复原有的操作
" U取消所有操作
" Ctrl+R可以恢复对使用u命令的操作
nnoremap <Leader>ud :GundoToggle<CR>

" 开启保存 undo 历史功能
set undofile

" undo 历史保存路径
set undodir=~/.undo_history/

" -------------------indent_guides列对齐线---------------------------------
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=0
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
let g:indent_guides_indent_levels = 10
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle


"-------vim_better_whitespace显示告警颜色------------------------------
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_only_modified_lines=1
let g:strip_whitelines_at_eof=1
let g:show_spaces_that_precede_tabs=1
let g:diff_binary='/usr/bin/diff -E'
let g:better_whitespace_filetypes_blacklist=['diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown']

cnoreabbrev stripws StripWhitespace

"--------------------light.vim配置-----------------------------------
" hide mode
set noshowmode
" showtabline always
set showtabline=2

let g:lightline = {
      \ 'colorscheme': 'onedark',
      \   'mode_map': { 'c': 'NORMAL' },
      \   'active': {
      \     'left': [ [ 'mode', 'paste' ],
      \               [ 'readonly', 'filename', 'modified' ],
      \               [ 'branch', 'cocdiag'] ],
      \     'right': [ [ 'percent', 'lineinfo' ],
      \                [ 'filetype', 'fileencoding' ],
      \                [ 'cocstatus' ] ],
      \   },
      \   'component_function': {
      \     'mode': 'LightlineMode',
      \     'branch': 'LightlineFugitive',
      \     'filename': 'LightlineFilename',
      \     'modified': 'LightlineModified',
      \     'filetype': 'LightlineFiletype',
      \     'fileencoding': 'LightlineFileencoding',
      \     'percent': 'LightlinePercent',
      \     'lineinfo': 'LightlineLineinfo',
      \     'cocdiag': 'LightlineStatusDiagnostic',
      \     'cocstatus': 'coc#status'
      \   },
      \   'component_expand': {
      \     'readonly': 'LightlineReadonly',
      \   },
      \   'component_type': {
      \     'readonly': 'warning',
      \   },
      \   'subseparator': {
      \     'left':  '',
      \     'right': ''
      \   },
      \ }

" functions
function! LightlineMode() abort
  if winwidth(0) <= 60
    return ''
  endif
  return lightline#mode()
endfunction

function! LightlineReadonly() abort
	return &ft !~? 'help\|vimfiler' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
		return (LightlineReadonly() !=# '' ? LightlineReadonly() . ' ' : '') .
		\ (&ft ==# 'vimfiler' ? vimfiler#get_status_string() :
		\  &ft ==# 'unite' ? unite#get_status_string() :
		\ expand('%:t') !=# '' ? expand('%:t') : '[No Name]') .
		\ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
endfunction

function! LightlineModified() abort
	return &ft =~# 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*FugitiveHead')
      let mark = '@'
      let branch = FugitiveHead()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFiletype() abort
  if winwidth(0) <= 70 || &filetype ==? 'denite'
    return ''
  endif
  return &filetype
endfunction

function! LightlineFileencoding() abort
  if winwidth(0) <= 70 || &filetype ==? 'denite'
    return ''
  endif
  return (&fileencoding !=# '' ? &fileencoding : &encoding) .
        \ '[' . &fileformat . ']'
endfunction

function! LightlinePercent() abort
  return printf('%3d%%', 100 * line('.') / line('$'))
endfunction

function! LightlineLineinfo() abort
  return printf('%3d:%-2d', line('.'), col('.'))
endfunction

function! LightlineStatusDiagnostic() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, 'E' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'W' . info['warning'])
  endif
endfunction

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" -------------------Tab与空格之间进行转换-------------------------------------
" Convert all leading spaces to tabs (default range is whole file):
function! Indenting(indent, what, cols)
  let spccol = repeat(' ', a:cols)
  let result = substitute(a:indent, spccol, '\t', 'g')
  let result = substitute(result, ' \+\ze\t', '', 'g')
  if a:what == 1
    let result = substitute(result, '\t', spccol, 'g')
  endif
  return result
endfunction

function! IndentConvert(line1, line2, what, cols)
  let savepos = getpos('.')
  let cols = empty(a:cols) ? &tabstop : a:cols
  execute a:line1 . ',' . a:line2 . 's/^\s\+/\=Indenting(submatch(0), a:what, cols)/e'
  call histdel('search', -1)
  call setpos('.', savepos)
endfunction

" Space2Tab, Convert lines 11 to 15 only (inclusive):
" 11,15Space2Tab
" Convert last visually-selected lines:
" '<,'>Space2Tab
" Same, converting leading tabs to spaces:
" '<,'>Tab2Space
command! -nargs=? -range=% Space2Tab call IndentConvert(<line1>,<line2>,0,<q-args>)
command! -nargs=? -range=% Tab2Space call IndentConvert(<line1>,<line2>,1,<q-args>)
command! -nargs=? -range=% RetabIndent call IndentConvert(<line1>,<line2>,&et,<q-args>)

"------------------vim-cpp-enhanced-highlight---------------------"
let c_no_curly_error = 1
