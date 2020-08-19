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
nnoremap <C-c> v"+y<Esc>
vnoremap <C-c> "+y<Esc>gv

"paste
nnoremap <C-v> "+gP
inoremap <C-v> <Esc>"+gpa
vnoremap <C-v> "+gP<Esc>gv

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
inoremap <C-s> <Esc>:update<CR>==gi
vnoremap <C-s> <Esc>:update<CR>gv=gv


"search
vnoremap / "hy/<C-r>h<CR>

"replace
vnoremap <C-h> "hy:.,$s/<C-r>h//gIc<left><left><left><left>
vnoremap <Leader>h "hy:.,$Subvert/<C-r>h{,s}/{,s}/gc<left><left><left><left><left><left><left>

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
nnoremap . i<Space><right><Esc>
nnoremap <Bs> i<Bs><right><Esc>
vnoremap <Bs> x<Esc>
nnoremap \ a<Space>\<Enter><Esc>h
nnoremap <CR> a<CR><Esc>
vnoremap <CR> xi<CR><Esc>

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

noremap <Leader>d :vertical diffsplit <C-r>% \| windo set wrap<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
noremap <expr> <Leader>t bufname('%') !~ 'coc-explorer' ? ':tabnew % \| term tig %<CR>' : ''
noremap <expr> <Leader>f bufname('%') !~ 'coc-explorer' ? ':tabnew % \| term tig <C-r>%<CR>' : ''
noremap <expr> <Leader>g bufname('%') !~ 'coc-explorer' ? ':vsplit % \| term git diff HEAD~ --color %<CR>' : ''

"cnoremap <Leader>d <C-c>
tmap <Leader>t <C-\><C-n>:bdelete!<CR>
tmap <Leader>f <C-\><C-n>:bdelete!<CR>
tmap <Leader>g <C-\><C-n>:bdelete!<CR>

"tnoremap <Esc> <C-\><C-n>
noremap zz <C-c>
noremap! zz <C-c>
tnoremap zz <C-c>
cnoremap zz <C-c>

"execute
nnoremap <C-x> :! 
nnoremap <Leader>x :!echo %:p \| xargs -I {} open {}<left><left><left> 
vnoremap <C-x> <Esc>:! 
vnoremap <Leader>x <Esc>:!echo %:p \| xargs -I {} open {}<left><left><left> 

"For javascript
nnoremap ` viw"hy}iconsole.log('<C-r>h');<Esc>oconsole.log(<C-r>h);<Esc>
vnoremap ` "hy}iconsole.log('<C-r>h');<Esc>oconsole.log(<C-r>h);<Esc>
nnoremap <leader>v viw"hd<Esc>:call SetVariable('')<left><left>
vnoremap <leader>v "hd<Esc>:call SetVariable('')<left><left>

function SetVariable(name)
  exe "normal! i".a:name    
  exe "normal! {iconst ".a:name." = "
  :normal "hp0
endfunction

nnoremap <leader>` viw"hd<Esc>:call SetFunction('')<left><left>
vnoremap <leader>` "hd<Esc>:call SetFunction('')<left><left>

function SetFunction(name)
  exe "normal! i".a:name."()"    
  exe "normal! }i".a:name."() {"
  :normal o
  :normal "hgpo
  exe "normal! i}"
endfunction

"macro
nnoremap Q @q
vnoremap Q :norm @q<CR>

"mouse
inoremap <LeftMouse> <Esc><LeftMouse>
vnoremap <2-LeftMouse> <2-LeftMouse>
vnoremap <3-LeftMouse> <Esc>0v$h
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
onoremap <M-LeftMouse> <C-C><4-LeftMouse>
noremap <M-LeftDrag> <LeftDrag>
inoremap <M-LeftDrag> <LeftDrag>
onoremap <M-LeftDrag> <C-C><LeftDrag>


"other
noremap <leader>1 :1wincmd w<CR>
noremap <leader>2 :2wincmd w<CR>
noremap <leader>3 :3wincmd w<CR>
noremap <leader>4 :4wincmd w<CR>
noremap <leader>5 :5wincmd w<CR>
noremap <leader>6 :6wincmd w<CR>
noremap <leader>7 :7wincmd w<CR>
noremap <leader>8 :8wincmd w<CR>
noremap <leader>9 :9wincmd w<CR>
noremap <leader>0 :exe winnr('$') 'wincmd w'<CR>

cabbr <expr> %% expand('%:p:h')
cnoreabbrev Q q
cnoreabbrev Qa qa
