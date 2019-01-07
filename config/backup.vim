let s:vim_backup = expand("$HOME/.vim/files/backup/")
if !isdirectory(s:vim_backup)
   silent! call mkdir(s:vim_backup, 'p')
endif
let s:vim_swap = expand("$HOME/.vim/files/swap/")
if !isdirectory(s:vim_swap)
   silent! call mkdir(s:vim_swap, 'p')
endif
let s:vim_undo = expand("$HOME/.vim/files/undo/")
if !isdirectory(s:vim_undo)
   silent! call mkdir(s:vim_undo, 'p')
endif
let s:vim_info = expand("$HOME/.vim/files/info/")
if !isdirectory(s:vim_info)
   silent! call mkdir(s:vim_info, 'p')
endif
set backup
set backupdir   =$HOME/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.vim/files/swap/
set updatecount =100
set undofile
set undodir     =$HOME/.vim/files/undo/
set viminfo     ='100,n$HOME/.vim/files/info/viminfo
