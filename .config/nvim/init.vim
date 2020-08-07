scriptencoding utf-8
source ~/dotfiles/.config/nvim/plugins.vim
let projectPath = substitute(getcwd(), expand('~'), '~', '')
set title titlestring=%{projectPath}
"set nocompatible " VIM 不使用和 VI 相容的模式
set shiftwidth=2 " 設定縮排寬度 = 4 
set tabstop=2    " tab 的字元數
set softtabstop=2
set expandtab    " 用 space 代替 tab
set ruler        " 顯示右下角設定值

set backspace=2  " 在 insert 也可用 backspace
set ic           " 設定搜尋忽略大小寫 igonrecase
set ru           " 第幾行第幾個字
set hlsearch     " 設定高亮度顯示搜尋結果
set incsearch    " 在關鍵字還沒完全輸入完畢前就顯示結果
set smartindent  " 設定 smartindent
set confirm      " 操作過程有衝突時，以明確的文字來詢問
set history=100  " 保留 100 個使用過的指令
"set cursorline!   " 顯示目前的游標位置
"set ve+=onemore  " 在最後加一個字元
set nobackup
set nowritebackup
set noswapfile
set updatetime=300
set cmdheight=2
set lazyredraw
set re=1

set statusline=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
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
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
"set statusline+=%{getcwd()}
set statusline+=%=                          " right align
"set statusline+=%#CursorLine#   " colour
"set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage
"set statusline+=\ %{winnr()}\           " window number

filetype plugin indent on     " required!
set noimdisable "切换到 normal,insert,search 模式时使用英文输入法
set iminsert=0
set imsearch=0
set number "relativenumber
"set clipboard=unnamed

"set ai           " 自動縮排
set mouse=a
"noremap p v"*p
"vnoremap p "*p<Esc>gv
"vnoremap y "*y<Esc>gv

nnoremap <C-c> v"+y<Esc>
vnoremap <C-c> "+y<Esc>gv

nnoremap <C-v> "+P
inoremap <C-v> <C-c>"+pa
vnoremap <C-v> "+P<Esc>gv

nnoremap <C-z> u
inoremap <C-z> <C-c>ua
vnoremap <C-z> <C-c>u
inoremap <C-r> <C-c><C-r>a

nnoremap <C-q> :q<CR>
inoremap <C-q> <C-c>:q<CR>
vnoremap <C-q> <C-c>:q<CR>
tnoremap <C-q> <C-\><C-n>:bdelete!<CR>

" for mac item2 ------------
"map <Leader>v <C-v>
"vmap <Leader>v <C-v>
"vmap <Leader>c <C-c>
"map <Leader>z <C-z> 
"imap <Leader>z <C-z> 
"map <Leader>r <C-r> 
" -------------------------
"nnoremap <Tab> i<Tab><right><Esc>
"nnoremap <S-Tab> <<
nnoremap . i<Space><right><Esc>
inoremap <LeftMouse> <Esc><LeftMouse>
nnoremap <2-LeftMouse> v
vnoremap <3-LeftMouse> <2-LeftMouse>
vnoremap <4-LeftMouse> <Esc>0v$h
cnoremap <expr> <LeftMouse> getcmdtype()==#'/' ? '<CR>' : '<C-c>'
cnoremap <expr> <ScrollWheelUp> getcmdtype()==#'/' ? '<CR>' : '<C-c>'
cnoremap <expr> <ScrollWheelDown> getcmdtype()==#'/' ? '<CR>' : '<C-c>'

nnoremap <S-ScrollWheelUp> <ScrollWheelLeft>
nnoremap <S-2-ScrollWheelUp> <2-ScrollWheelLeft>
nnoremap <S-3-ScrollWheelUp> <3-ScrollWheelLeft>
nnoremap <S-4-ScrollWheelUp> <4-ScrollWheelLeft>
nnoremap <S-ScrollWheelDown> <ScrollWheelRight>
nnoremap <S-2-ScrollWheelDown> <2-ScrollWheelRight>
nnoremap <S-3-ScrollWheelDown> <3-ScrollWheelRight>
nnoremap <S-4-ScrollWheelDown> <4-ScrollWheelRight>

nnoremap <silent> <Esc> :noh<CR>:diffoff<CR><Esc>
vnoremap / "hy/<C-r>h<CR>
" for gf
set suffixesadd=.js,.jsx
set hidden
set directory=/tmp
set path+=**

" for move block
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <C-c>:m .+1<CR>==gi
inoremap <M-k> <C-c>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
nnoremap <M-f> :Format<CR>
inoremap <M-f> <C-c>:Format<CR>
vnoremap <M-f> <C-c>:Format<CR>
autocmd FileType vue nnoremap <buffer> <M-f> mm:%!vue-formatter<CR>`m
autocmd FileType vue inoremap <buffer> <M-f> <C-c>mm:%!vue-formatter<CR>`mm
autocmd FileType vue vnoremap <buffer> <M-f> <C-c>mm:%!vue-formatter<CR>`mm


nnoremap <C-s> :update<CR>
inoremap <C-s> <C-c>:update<CR>
vnoremap <C-s> <C-c>:update<CR>

"macro
nnoremap Q @q
vnoremap Q :norm @q<CR>

"global
nnoremap <C-n> :set invnu<CR>
inoremap <C-n> <C-c>:set invnu<CR>a

nnoremap x "_x
vnoremap x "_x
nnoremap D "*dd
vnoremap D "*d

vnoremap <C-h> "hy:%s/<C-r>h//gIc<left><left><left><left>
vnoremap <Leader>h "hy:%Subvert/<C-r>h{,s}/{,s}/gc<left><left><left><left><left><left><left>

"tnoremap <Esc> <C-\><C-n>
noremap zz <C-c>
noremap! zz <C-c>
tnoremap zz <C-c>
cnoremap zz <C-c>

cnoreabbrev Q q
cnoreabbrev Qa qa

noremap <leader>1 :1wincmd w<CR>
noremap <leader>2 :2wincmd w<CR>
noremap <leader>3 :3wincmd w<CR>
noremap <leader>4 :4wincmd w<CR>
noremap <leader>5 :5wincmd w<CR>
noremap <leader>6 :6wincmd w<CR>
noremap <leader>7 :7wincmd w<CR>
noremap <leader>8 :8wincmd w<CR>
noremap <leader>9 :9wincmd w<CR>

nnoremap <Bs> i<Bs><right><Esc>

vnoremap <Bs> x<Esc>
nnoremap \ a<Space>\<Enter><Esc>h
nnoremap <CR> a<Enter><Esc>
vnoremap <CR> x<Esc>

nnoremap ` viw"hy}iconsole.log('<C-r>h');<Esc>oconsole.log(<C-r>h);<Esc>
vnoremap ` "hy}iconsole.log('<C-r>h');<Esc>oconsole.log(<C-r>h);<Esc>
nnoremap <leader>` viw"hd<Esc>:call SetVariable('')<left><left>
vnoremap <leader>` "hd<Esc>:call SetVariable('')<left><left>

function SetVariable(name)
  exe "normal! i".a:name    
  exe "normal! {iconst ".a:name." = "
  :normal "hp0
endfunction

nnoremap <C-x> :! 
nnoremap <Leader>x :!echo %:p \| xargs -I {} open {}<left><left><left> 
noremap <silent> <C-a> ggVG
noremap <Leader>d :vertical diffsplit <C-r>% \| windo set wrap<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
cnoremap <Leader>d <C-c>

noremap <M-LeftMouse> <4-LeftMouse>
inoremap <M-LeftMouse> <4-LeftMouse>
onoremap <M-LeftMouse> <C-C><4-LeftMouse>
noremap <M-LeftDrag> <LeftDrag>
inoremap <M-LeftDrag> <LeftDrag>
onoremap <M-LeftDrag> <C-C><LeftDrag>
cabbr <expr> %% expand('%:p:h')



" Go to tab by number
"noremap <leader>t1 1gt
"noremap <leader>t2 2gt
"noremap <leader>t3 3gt
"noremap <leader>t4 4gt
"noremap <leader>t5 5gt
"noremap <leader>t6 6gt
"noremap <leader>t7 7gt
"noremap <leader>t8 8gt
"noremap <leader>t9 9gt
"noremap <leader>t0 :tablast<CR>

""noremap h i
""noremap i k
"noremap k l
"noremap u k
"noremap l u
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
