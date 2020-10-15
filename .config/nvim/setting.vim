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
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif

au BufNewFile,BufRead *.ejs set filetype=html
autocmd BufEnter *.png,*.jpg,*.gif,*.svg exec "! open ".expand("%") | :bw

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
let loaded_netrwPlugin = 1

