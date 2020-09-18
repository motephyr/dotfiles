let projectPath = substitute(getcwd(), expand('~'), '~', '')
set title titlestring=%{projectPath}
"set nocompatible " VIM 不使用和 VI 相容的模式
set shiftwidth=2 " 設定縮排寬度 = 4 
set tabstop=2    " tab 的字元數
set softtabstop=2
set expandtab    " 用 space 代替 tab

set backspace=2  " 在 insert 也可用 backspace
set ic           " 設定搜尋忽略大小寫 igonrecase
set hlsearch     " 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
set smartindent  " 設定 smartindent
set confirm      " 操作過程有衝突時，以明確的文字來詢問
set history=100  " 保留 100 個使用過的指令
"set cursorline!   " 顯示目前的游標位置
set ve+=onemore  " 在最後加一個字元
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

au BufNewFile,BufRead *.ejs set filetype=html
autocmd BufEnter *.png,*.jpg,*.gif,*.svg exec "! open ".expand("%") | :bw

set nobackup
set nowritebackup
set noswapfile
set updatetime=750
set cmdheight=2
set lazyredraw
"set re=1
set statusline=%{ScrollBarWidth(BarWidth())}
set statusline+=%=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=\ %Y\                   " short file name
set statusline+=%#CursorIM#     " colour
set statusline+=\ %2l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %{line('$')}
set statusline+=\ Lines\                " percentage

filetype plugin indent on     " required!
set noimdisable "切换到 normal,insert,search 模式时使用英文输入法
set iminsert=0
set imsearch=0
set number "relativenumber
"set clipboard=unnamed

"set ai           " 自動縮排
set mouse=a
" for gf
set suffixesadd=.js,.jsx
set hidden
set directory=/tmp
set path+=**
set splitbelow
set splitright

func! BarWidth()
    let lessLength = winwidth('$') - (len(expand('%:t'))+len(&filetype)+ len(line('$'))*2+31)
    return line('$') > winheight('%') ? lessLength : line('$')*lessLength/winheight('%')
endfun


let b:cmdlist = []
func! GetDiffList()
  let cmd = "git diff --unified=0 ".expand('%')." | sed -n -e 's/^.*+\\([0-9]*\\)\\([ ,]\\).*/\\1/p' | awk 'NF > 0'"
  "sed -n -e 's/^.*+\([0-9]*\)\([ ,]\).*/\1/p' | awk 'NF > 0'
  let b:cmdlist = systemlist(cmd)
endfun

autocmd BufWinEnter,BufWritePost * call GetDiffList()


func! ScrollBarWidth(barWidth)
  if a:barWidth > 3 
    let left = (line('$') - line('w0') >= winheight('%')) ? (line('w0') - 1) *a:barWidth/line('$') : (line('$') - winheight('%'))*a:barWidth/line('$') 
    let front = line('$') > line('w$') ? left : left + 1
    let scroll = (winheight('%')*a:barWidth/line('$') > 1) ? winheight('%')*a:barWidth/line('$') : 1

    let s = GetPosition(front, scroll, a:barWidth)
    return '['.s.']'
  else
    return ''
  endif
endfun

func! GetPosition(front, scroll,  barWidth)
  let c = ''
  let n = 1
  while n <= a:barWidth
    if index(TransDiffList(a:barWidth), n) >= 0
      let c .= '|'
    elseif n >= a:front && n <= a:front+a:scroll 
      let c .= '-'
    else
      let c .= ' '
    endif
    let n += 1
  endwhile
  return c
endfun

func! TransDiffList(barWidth)
  let nlist = []
  for l in b:cmdlist
    let nlist = add(nlist, str2nr(l)*a:barWidth/line('$'))
  endfor
  "echo cmd
  "echo list
  "echo nlist
  return nlist
endfun



fun! CaptureClickStatusLine(position)
  let line = line('$')/winheight('%') 
  if a:position == 'down'
    let aline = line('.') + line
  else
    let aline = line('.') - line
  endif
  return aline.'G'
endfun


nnoremap <expr> <M-ScrollWheelUp> CaptureClickStatusLine('up')
nnoremap <expr> <M-ScrollWheelDown> CaptureClickStatusLine('down')

