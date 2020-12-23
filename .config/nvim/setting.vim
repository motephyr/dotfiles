let projectPath = substitute(getcwd(), expand('~'), '~', '')
set title titlestring=%{projectPath}
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
set ve+=onemore  " 在最後加一個字元
set sel=exclusive

let CursorColumnI = 0 "the cursor column position in INSERT

augroup setting | au!
  au InsertEnter * let CursorColumnI = col('.')
  au CursorMovedI * let CursorColumnI = col('.')
  au InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif
  au BufNewFile,BufRead *.ejs,*.edge,*.cshtml set filetype=html
  au BufEnter *.png,*.jpg,*.gif exec "! open ".expand("%") | :bw
augroup end

set nobackup
set nowritebackup
set noswapfile
set updatetime=300
set shortmess+=c
set cmdheight=2
set lazyredraw

filetype plugin indent on     " required!
set noimdisable "切换到 normal,insert,search 模式时使用英文输入法
set iminsert=0
set imsearch=0
set number 

"set ai           " 自動縮排
set mouse=a

" for gf key
set suffixesadd=.js,.jsx
set hidden
set directory=/tmp
set path+=**
set splitbelow
set splitright
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.pdf,*.psd
set wildignore+=node_modules/*,bower_components/*

let g:loaded_matchparen = 1
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set grepformat=%f:%l:%c:%m

fu! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
   " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

      " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

      " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  return s
endfu

fu! MyTabLabel(n)
  return split(getcwd(0, a:n),'/')[-1]
   " return substitute(getcwd(0, a:n), expand('~'), '~', '')
endfu
set tabline=%!MyTabLine()

