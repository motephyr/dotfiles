scriptencoding utf-8
source ~/dotfiles/.config/nvim/plugins.vim

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
set ve+=onemore  " 在最後加一個字元
set nobackup
set nowritebackup
set noswapfile
set updatetime=300
set cmdheight=2
set lazyredraw

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
noremap p "*p
vnoremap p "*p<Esc>gv
vnoremap y "*y<Esc>gv
inoremap <LeftMouse> <Esc><LeftMouse>
vnoremap <3-LeftMouse> <Esc>0v$h
vnoremap / "hy/<C-r>h
" for gf
set suffixesadd=.js,.jsx
set hidden
set directory=/tmp
set path+=**

" for move block(linux, window)
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <C-c>:m .+1<CR>==gi
inoremap <A-k> <C-c>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" for move block(mac)
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <C-c>:m .+1<CR>==gi
inoremap ˚ <C-c>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

"macro
nnoremap Q @q
vnoremap Q :norm @q<cr>

"global
nnoremap <C-n> :set invnu<cr>
inoremap <C-n> <C-c>:set invnu<cr>i

nnoremap x "_x
vnoremap x "_x
nnoremap D "*dd
vnoremap D "*d

vnoremap <Leader><C-r> "hy:%Subvert/<C-r>h{,s}/{,s}/gc<left><left><left><left><left><left><left>
vnoremap <C-r> "hy:%s/<C-r>h//gIc<left><left><left><left>

"tnoremap <Esc> <C-\><C-n>
noremap zz <C-c>
noremap! zz <C-c>
tnoremap zz <C-c>
cnoremap zz <C-c>

map <C-q> :q<CR>
imap <C-q> <C-c>:q<CR>
map <C-s> :update<CR>
imap <C-s> <C-c>:update<CR>gi
map Y ^vg_y
cnoreabbrev Q q
cnoreabbrev Qa qa

noremap <leader>1 :1wincmd w<cr>
noremap <leader>2 :2wincmd w<cr>
noremap <leader>3 :3wincmd w<cr>
noremap <leader>4 :4wincmd w<cr>
noremap <leader>5 :5wincmd w<cr>
noremap <leader>6 :6wincmd w<cr>
noremap <leader>7 :7wincmd w<cr>
noremap <leader>8 :8wincmd w<cr>
noremap <leader>9 :9wincmd w<cr>

nmap <Bs> db

vmap <Bs> x<Esc>
nnoremap \ i<Space>\<Enter><Esc>h 
nnoremap <CR> i<Enter><Esc>
vnoremap <CR> x<Esc>

nnoremap ` viw"hy}iconsole.log('<C-r>h');<Esc>oconsole.log(<C-r>h);<Esc>
vnoremap ` "hy}iconsole.log('<C-r>h');<Esc>oconsole.log(<C-r>h);<Esc>

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
"noremap <leader>t0 :tablast<cr>

"noremap h i
"noremap i k
"noremap k j
"noremap j h
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
