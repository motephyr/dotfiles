nnoremap <C-S-i> <C-i>
let mapleader = ","
nnoremap <silent> <Esc> :noh<CR>:diffoff<CR><Esc>

"Generally speaking, normal insert visual needs to be mapped
"In some cases, insert does not require map
"In some cases visual does not need map, insert does not need map either
"If the content will change, skip to normal mode
"In some cases only visual (must select word)
"Use noremap when you don’t care about the difference between normal and visual mode

"global
nnoremap <C-n> :set invnu<CR>

"copy
nnoremap <C-c> V"+ygv
vnoremap <C-c> "+ygv

"quit all
nnoremap <C-q> :qa<CR>
inoremap <C-q> <Esc>:qa<CR>
vnoremap <C-q> <Esc>:qa<CR>
tnoremap <C-q> <C-\><C-n>:qa<CR>

"for visual insert
" vnoremap <S-a> <Esc>i
" vmap <S-i> o<S-a>

"paste
" nnoremap <C-v> "+gP
" inoremap <C-v> <Esc>"+gPi
" vnoremap <C-v> "+gPgv
"set clipboard^=,unnamedplus

"undo & redo
nnoremap <C-z> u
inoremap <C-z> <Esc>
vnoremap <C-z> <Esc>
inoremap <C-r> <Esc><C-r>
vnoremap <C-r> <Esc><C-r>

nnoremap u <Esc>
vnoremap u <Esc>


"quit
nnoremap <C-w> :q<CR>
inoremap <C-w> <Esc>:q<CR>
vnoremap <C-w> <Esc>:q<CR>
tnoremap <C-w> <C-\><C-n>:bdelete!<CR>
nnoremap <M-w> :q<CR>
inoremap <M-w> <Esc>:q<CR>
vnoremap <M-w> <Esc>:q<CR>
tnoremap <M-w> <C-\><C-n>:bdelete!<CR>

"save
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
vnoremap <C-s> <Esc>:update<CR>

"fold
noremap <C-l> :call ToogleFold()<CR>
vnoremap <C-l> :call ToogleFold()<CR>
function! ToogleFold()
     if &foldlevel == 0
       :Fold
     endif
     if &foldlevel >= 99
         "normal! zM<CR> (folds all)
         set foldlevel=1
     else
         "normal! zR<CR> (unfolds everything)
         set foldlevel=99
     endif
endfunction
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

"search
" vmap / <Esc>/
" vmap <M-/> y/<C-r>"<CR>NNo
vmap / y/<C-r>"<CR>NNo

nmap ? viw/
nnoremap <silent> n gn 
nnoremap <silent> N gN
vnoremap <silent> n <Esc>ngn
vnoremap <silent> N <Esc>NgN
cnoremap <expr> <CR> getcmdtype()=='/' ? '<CR>gn' : '<CR>'

"replace
nnoremap <M-h> v"hy:.,$s/<C-r>h//gIc<left><left><left><left>
vnoremap <M-h> "hy:.,$s/<C-r>h//gIc<left><left><left><left>
nnoremap <Leader>h v"hy:grep <C-r>h \| cfdo %s/<C-r>h//gIc \| update<left><left><left><left><left><left><left><left><left><left><left><left><left>
vnoremap <Leader>h "hy:grep <C-r>h \| cfdo %s/<C-r>h//gIc \| update<left><left><left><left><left><left><left><left><left><left><left><left><left>
"select all
nnoremap <silent> <C-a> ggVG
inoremap <silent> <C-a> <Esc>ggVG
vnoremap <silent> <C-a> <Esc>ggVG

"delete
nnoremap x "_x
vnoremap x "_x
nnoremap D "+dd
vnoremap D "+d

"Fix
nnoremap ' vi
nnoremap " va
vnoremap ' <Esc>vi
vnoremap " <Esc>va

nnoremap M 'm
vnoremap M 'm
nnoremap m mm
vnoremap m mm
nnoremap <Bs> i<Bs>
vnoremap <Bs> s
nnoremap <Space> i<Space>
vnoremap <Space> s

nnoremap \ a<Space>\<Enter><Esc>h

" for move block
nnoremap <M-j> :m .+1<CR>==
nnoremap <M-k> :m .-2<CR>==
inoremap <M-j> <Esc>:m .+1<CR>==gi
inoremap <M-k> <Esc>:m .-2<CR>==gi
vnoremap <M-j> :m '>+1<CR>gv=gv
vnoremap <M-k> :m '<-2<CR>gv=gv
nnoremap <M-f> :Format<CR>
inoremap <M-f> <Esc>:Format<CR>
vnoremap <M-f> <Esc>:Format<CR>

if has('nvim')
  augroup terminal_setup | au!
    autocmd TermOpen,BufEnter term://* startinsert
    autocmd TermOpen * setlocal nonumber
    autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
    autocmd FileType fzf nnoremap <buffer><LeftMouse> i
    autocmd FileType fzf nnoremap <buffer>k i<Up>
    autocmd FileType fzf nnoremap <buffer>j i<Down>
    autocmd FileType fzf nnoremap <buffer><Up> i<Up>
    autocmd FileType fzf nnoremap <buffer><Down> i<Down>
  augroup end
endif

"execute
noremap <C-x> <Esc>:!echo %:p \| xargs -I {} open {}<left><left><left>
function! TerminalPane()
  " find evey terminal buffer
  let b = filter(range(1, winnr('$')),
        \'getwinvar(v:val, "&buftype", "ERROR") == "terminal"')
  if len(b) > 0
    exe b[0].'wincmd w'
  else
    :exe winnr('$') 'wincmd w' | :sp | resize 8 | term
  endif
  startinsert
endfunc

noremap <silent> <M-`> :call TerminalPane()<cr>
tnoremap <silent> <M-`> <C-\><C-n>:bdelete!<CR>

"For javascript
nnoremap ` viw"hy}iconsole.log('<C-r>h');<Esc>oconsole.log(<C-r>h);<Esc>
vnoremap ` "hy}iconsole.log('<C-r>h');<Esc>oconsole.log(<C-r>h);<Esc>

"macro
nnoremap q qq
vnoremap q :norm qq<CR>

nnoremap Q @q<Esc>
vnoremap Q :norm @q<CR>

"mouse
noremap <RightMouse> <LeftMouse>i
inoremap <RightMouse> <LeftMouse>

inoremap <LeftMouse> <Esc><LeftMouse>
vnoremap <3-LeftMouse> <Esc>0v$
nnoremap <M-LeftMouse> <4-LeftMouse>
vnoremap <M-LeftMouse> <RightMouse>
inoremap <M-LeftMouse> <4-LeftMouse>
onoremap <M-LeftMouse> <Esc><4-LeftMouse>
noremap <M-LeftDrag> <LeftDrag>
inoremap <M-LeftDrag> <LeftDrag>
onoremap <M-LeftDrag> <Esc><LeftDrag>
noremap <M-LeftRelease> <Nop>

"Command mode need use C-c, not esc. otherwise there is error message
cnoremap <expr> <LeftMouse> getcmdtype()==#'/' ? '<CR>' : '<C-c>'
cnoremap <expr> <ScrollWheelUp> getcmdtype()==#'/' ? '<CR>' : '<C-c>'
cnoremap <expr> <ScrollWheelDown> getcmdtype()==#'/' ? '<CR>' : '<C-c>'

inoremap <C-u> <C-o><C-u>
inoremap <C-d> <C-o><C-d>

noremap <M-ScrollWheelUp> <C-u>
noremap <M-ScrollWheelDown> <C-d>

noremap <S-ScrollWheelUp> <ScrollWheelLeft>
noremap <S-2-ScrollWheelUp> <2-ScrollWheelLeft>
noremap <S-3-ScrollWheelUp> <3-ScrollWheelLeft>
noremap <S-4-ScrollWheelUp> <4-ScrollWheelLeft>
noremap <S-ScrollWheelDown> <ScrollWheelRight>
noremap <S-2-ScrollWheelDown> <2-ScrollWheelRight>
noremap <S-3-ScrollWheelDown> <3-ScrollWheelRight>
noremap <S-4-ScrollWheelDown> <4-ScrollWheelRight>
inoremap <S-ScrollWheelUp> <ScrollWheelLeft>
inoremap <S-2-ScrollWheelUp> <2-ScrollWheelLeft>
inoremap <S-3-ScrollWheelUp> <3-ScrollWheelLeft>
inoremap <S-4-ScrollWheelUp> <4-ScrollWheelLeft>
inoremap <S-ScrollWheelDown> <ScrollWheelRight>
inoremap <S-2-ScrollWheelDown> <2-ScrollWheelRight>
inoremap <S-3-ScrollWheelDown> <3-ScrollWheelRight>
inoremap <S-4-ScrollWheelDown> <4-ScrollWheelRight>

"other
" noremap <C-1> <Esc>:1wincmd w<CR>
" noremap <C-2> <Esc>:2wincmd w<CR>
" noremap <C-3> <Esc>:3wincmd w<CR>
" noremap <C-4> <Esc>:4wincmd w<CR>
" noremap <C-5> <Esc>:5wincmd w<CR>
" noremap <C-6> <Esc>:6wincmd w<CR>
" noremap <C-7> <Esc>:7wincmd w<CR>
" noremap <C-8> <Esc>:exe winnr('$') 'wincmd w'<CR>
" noremap <C-9> <Esc>:vnew<CR>
" noremap <C-0> <Esc>:bdelete!<CR>
" tnoremap <C-1> <C-\><C-n>:1wincmd w<CR>
" tnoremap <C-2> <C-\><C-n>:2wincmd w<CR>
" tnoremap <C-3> <C-\><C-n>:3wincmd w<CR>
" tnoremap <C-4> <C-\><C-n>:4wincmd w<CR>
" tnoremap <C-5> <C-\><C-n>:5wincmd w<CR>
" tnoremap <C-6> <C-\><C-n>:6wincmd w<CR>
" tnoremap <C-7> <C-\><C-n>:7wincmd w<CR>
" tnoremap <C-8> <C-\><C-n>:exe winnr('$') 'wincmd w'<CR>
" tnoremap <C-9> <C-\><C-n>:vnew<CR>
" tnoremap <C-0> <C-\><C-n>:bdelete!<CR>
nnoremap <C-`> :tabnext<CR>
nnoremap <C-1> 1gt
nnoremap <C-2> 2gt
nnoremap <C-3> 3gt
nnoremap <C-4> 4gt
nnoremap <C-5> 5gt
nnoremap <C-6> 6gt
nnoremap <C-7> 7gt
nnoremap <C-8> :tablast
nnoremap <C-9> :tabnew \| terminal<CR>
nnoremap <C-0> :tabclose<CR>
tnoremap <C-`> <C-\><C-n>:tabnext<CR>
tnoremap <C-1> <C-\><C-n>1gt
tnoremap <C-2> <C-\><C-n>2gt
tnoremap <C-3> <C-\><C-n>3gt
tnoremap <C-4> <C-\><C-n>4gt
tnoremap <C-5> <C-\><C-n>5gt
tnoremap <C-6> <C-\><C-n>6gt
tnoremap <C-7> <C-\><C-n>7gt
tnoremap <C-8> <C-\><C-n>:tablast
tnoremap <C-9> <C-\><C-n>:tabnew \| terminal<CR>
tnoremap <C-0> <C-\><C-n>:tabclose<CR>

noremap <M-1> <Esc>:1wincmd w<CR>
noremap <M-2> <Esc>:2wincmd w<CR>
noremap <M-3> <Esc>:3wincmd w<CR>
noremap <M-4> <Esc>:4wincmd w<CR>
noremap <M-5> <Esc>:5wincmd w<CR>
noremap <M-6> <Esc>:6wincmd w<CR>
noremap <M-7> <Esc>:7wincmd w<CR>
noremap <M-8> <Esc>:exe winnr('$') 'wincmd w'<CR>
noremap <M-9> <Esc>:vsp \| terminal<CR>
noremap <M-0> <Esc>:bdelete!<CR>

tnoremap <M-1> <C-\><C-n>:1wincmd w<CR>
tnoremap <M-2> <C-\><C-n>:2wincmd w<CR>
tnoremap <M-3> <C-\><C-n>:3wincmd w<CR>
tnoremap <M-4> <C-\><C-n>:4wincmd w<CR>
tnoremap <M-5> <C-\><C-n>:5wincmd w<CR>
tnoremap <M-6> <C-\><C-n>:6wincmd w<CR>
tnoremap <M-7> <C-\><C-n>:7wincmd w<CR>
tnoremap <M-8> <C-\><C-n>:exe winnr('$') 'wincmd w'<CR>
tnoremap <M-9> <C-\><C-n>:vsp \| terminal<CR>
tnoremap <M-0> <C-\><C-n>:bdelete!<CR>


" cnoremap <silent><expr> <Tab> getcmdtype()=='/' ?
"       \ '<CR><C-w>w/<CR>' :
"       \ "<C-z>"
cnoremap <silent><expr> <S-Tab> getcmdtype()=='/' ?
      \ '<CR><C-w>W/<CR>' :
      \ "<S-Tab>"
noremap <Tab> <C-w>w
noremap <S-Tab> <C-w>W
tnoremap <S-Tab> <C-\><C-n><C-w>W

nnoremap <leader>` :tabnext<CR>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 :tablast
nnoremap <leader>9 :tabnew \| terminal<CR>
nnoremap <leader>0 :tabclose<CR>

tnoremap <leader>` <C-\><C-n>:tabnext<CR>
tnoremap <leader>1 <C-\><C-n>1gt
tnoremap <leader>2 <C-\><C-n>2gt
tnoremap <leader>3 <C-\><C-n>3gt
tnoremap <leader>4 <C-\><C-n>4gt
tnoremap <leader>5 <C-\><C-n>5gt
tnoremap <leader>6 <C-\><C-n>6gt
tnoremap <leader>7 <C-\><C-n>7gt
tnoremap <leader>8 <C-\><C-n>:tablast
tnoremap <leader>9 <C-\><C-n>:tabnew \| terminal<CR>
tnoremap <leader>0 <C-\><C-n>:tabclose<CR>

noremap <M-g> <Esc>:tabnew \| term tig<CR>
inoremap <M-g> <Esc>:tabnew \| term tig<CR>
noremap <expr> <M-t> (index(['','coc-explorer', 'NvimTree'],bufname('%'))<0) ? '<Esc>:tabnew % \| term tig <C-r>%<CR>' : ''
inoremap <expr> <M-t> (index(['','coc-explorer', 'NvimTree'],bufname('%'))<0) ? '<Esc>:tabnew % \| term tig <C-r>%<CR>' : ''

noremap <expr> <Leader>g (index(['','coc-explorer', 'NvimTree'],bufname('%'))<0) ? '<Esc>:vsplit % \| term git diff HEAD~2 %<CR>' : ''
noremap <leader>t :tabnew \| tcd ../ \| call ToggleVExplorer()<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
noremap <Leader>f <Esc>:tabnew %<CR>


nnoremap <Leader>ve :tabnew \| e $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<CR>

cabbr <expr> %% expand('%:p:h')
cnoreabbrev Q q
cnoreabbrev Qa qa

vnoremap > >gv
vnoremap < <gv

