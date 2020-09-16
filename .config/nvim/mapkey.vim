let mapleader = " "
nnoremap <leader>vs :source $MYVIMRC<CR>
nnoremap <Leader>ve :e $MYVIMRC<cr>

nnoremap <silent> <Esc> :noh<CR>:diffoff<CR><Esc>
"tnoremap <Esc> <C-\><C-n>
map zz <Esc>
imap zz <Esc>
tnoremap zz <C-\><C-n>:bdelete!<CR>
"Avoid execute command by C-c
cnoremap zz <C-c> 

"Generally speaking, normal insert visual needs to be mapped
"In some cases, insert does not require map
"In some cases visual does not need map, insert does not need map either
"If the content will change, skip to normal mode
"In some cases only visual (must select word)
"Use noremap when you don’t care about the difference between normal and visual mode

"global
nnoremap <C-n> :set invnu<CR>

"copy
vnoremap <C-c> "+ygv<Esc>

"paste
nnoremap <C-v> "+gP
inoremap <C-v> <Esc>"+gPi
vnoremap <C-v> "+gPgv

"undo & redo
nnoremap <C-z> u
inoremap <C-z> <Esc>u
vnoremap <C-z> <Esc>u
inoremap <C-r> <Esc><C-r>
vnoremap <C-r> <Esc><C-r>

"quit
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>
vnoremap <C-q> <Esc>:q<CR>
tnoremap <C-q> <C-\><C-n>:bdelete!<CR>

"save
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>
vnoremap <C-s> <Esc>:update<CR>
"inoremap <C-s> <Esc>:update<CR>==gi
"vnoremap <C-s> <Esc>:update<CR>gv=gv

"search
vnoremap / "hy/<C-r>h<CR>

"replace
vnoremap <M-h> "hy:.,$s/<C-r>h//gIc<left><left><left><left>
nnoremap <M-h> :cfdo s/<C-r>h//gIc \| update<left><left><left><left><left><left><left><left><left><left><left><left><left>

"select all
nnoremap <silent> <C-a> ggVG
inoremap <silent> <C-a> <Esc>ggVG
vnoremap <silent> <C-a> <Esc>ggVG

"delete
nnoremap x "_x
vnoremap x "_x
nnoremap D "*dd
vnoremap D "*d

"Fix
"nnoremap ' i<Space><Esc><right>
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
nnoremap \ a<Space>\<Enter><Esc>h
nnoremap <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : 'i<CR>'
vnoremap <CR> xi<CR>

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

noremap <C-h> <Left>
noremap <C-j> <Down>
noremap <C-k> <Up>
noremap <C-l> <Right>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>
tnoremap <C-h> <Left>
tnoremap <C-j> <Down>
tnoremap <C-k> <Up>
tnoremap <C-l> <Right>

noremap <Leader>d :vertical diffsplit <C-r>% \| windo set wrap<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
noremap <expr> <Leader>t bufname('%') !~ 'coc-explorer' ? '<Esc>:tabnew % \| term tig<CR>' : ''
noremap <expr> <Leader>f bufname('%') !~ 'coc-explorer' ? '<Esc>:tabnew % \| term tig <C-r>%<CR>' : ''
noremap <expr> <Leader>g bufname('%') !~ 'coc-explorer' ? '<Esc>:vsplit % \| term git diff HEAD~ --color %<CR>' : ''

"cnoremap <Leader>d <C-c> "type Leader key<Space> wiil slow
" tmap <Leader>t <C-\><C-n>:bdelete!<CR>
" tmap <Leader>f <C-\><C-n>:bdelete!<CR>
" tmap <Leader>g <C-\><C-n>:bdelete!<CR>

if has('nvim')
  augroup terminal_setup | au!
    autocmd TermOpen,BufEnter term://* startinsert
    autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
    autocmd TermOpen * nnoremap <buffer><ScrollWheelUp> ik
    autocmd TermOpen * nnoremap <buffer><ScrollWheelDown> ij
  augroup end
endif

"execute
noremap <C-x> <Esc>:!echo %:p \| xargs -I {} open {}<left><left><left>
noremap <Leader>x <Esc>:split % \| resize 8 \| term<CR>
tmap <Leader>x <C-\><C-n>:bdelete!<CR>


"For javascript
nnoremap ` viw"hy}iconsole.log('<C-r>h');<Esc>oconsole.log(<C-r>h);<Esc>
vnoremap ` "hy}iconsole.log('<C-r>h');<Esc>oconsole.log(<C-r>h);<Esc>
"nnoremap <leader>v viw"hd<Esc>:call SetVariable('')<left><left>
vnoremap <leader>v :call SetVariable('')<left><left>

function SetVariable(name) range
  silent! normal gvd
  exe "normal! i".a:name    
  exe "normal! {iconst ".a:name." = "
  :normal gp
  exe "normal! i\n"    
endfunction

"nnoremap <leader>` viw"hd<Esc>:call SetFunction('')<left><left>
vnoremap <leader>m :call SetMethod('')<left><left>

function SetMethod(name) range
  silent! normal gvd
  exe "normal! i".a:name."()\n"    
  exe "normal! }i".a:name."() {"
  :normal o
  :normal gp
  exe "normal! i}\n"
endfunction

"macro
nnoremap Q @q
vnoremap Q :norm @q<CR>

"mouse
"nnoremap <expr> <LeftDrag> col('$')==col('.')?'<left><LeftDrag>':'<LeftDrag>'

inoremap <LeftMouse> <Esc><LeftMouse>
"vnoremap <2-LeftMouse> <2-LeftMouse>
vnoremap <3-LeftMouse> <Esc>0v$h

"Command mode need use C-c, not esc. otherwise there is error message
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

noremap <M-LeftMouse> <4-LeftMouse>
inoremap <M-LeftMouse> <4-LeftMouse>
onoremap <M-LeftMouse> <Esc><4-LeftMouse>
noremap <M-LeftDrag> <LeftDrag>
inoremap <M-LeftDrag> <LeftDrag>
onoremap <M-LeftDrag> <Esc><LeftDrag>

"other
noremap <M-1> :1wincmd w<CR>
noremap <M-2> :2wincmd w<CR>
noremap <M-3> :3wincmd w<CR>
noremap <M-4> :4wincmd w<CR>
noremap <M-5> :5wincmd w<CR>
noremap <M-6> :6wincmd w<CR>
noremap <M-7> :7wincmd w<CR>
noremap <M-8> :exe winnr('$') 'wincmd w'<CR>
tnoremap <M-1> <C-\><C-n>:1wincmd w<CR>
tnoremap <M-2> <C-\><C-n>:2wincmd w<CR>
tnoremap <M-3> <C-\><C-n>:3wincmd w<CR>
tnoremap <M-4> <C-\><C-n>:4wincmd w<CR>
tnoremap <M-5> <C-\><C-n>:5wincmd w<CR>
tnoremap <M-6> <C-\><C-n>:6wincmd w<CR>
tnoremap <M-7> <C-\><C-n>:7wincmd w<CR>
tnoremap <M-8> <C-\><C-n>:exe winnr('$') 'wincmd w'<CR>


cabbr <expr> %% expand('%:p:h')
cnoreabbrev Q q
cnoreabbrev Qa qa

" nnoremap <Tab> >>_
" nnoremap <S-Tab> <<_
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
