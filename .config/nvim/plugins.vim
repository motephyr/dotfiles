let mapleader = " "

call plug#begin()
Plug 'ianding1/leetcode.vim'
let g:leetcode_solution_filetype = 'javascript'
let g:leetcode_browser = 'chrome'

  " search
  " Plug 'fntlnz/atags.vim' " file tags generating with ctags
  Plug 'easymotion/vim-easymotion' " ;s ;w ;L / ;f
  "let g:EasyMotion_do_mapping = 0
  "let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
  "let g:EasyMotion_smartcase = 1
  "map ' <Plug>(easymotion-bd-f)
  "nmap ' <Plug>(easymotion-overwin-f)
  "map  / <Plug>(easymotion-sn)
  "omap / <Plug>(easymotion-tn)
  "map  n <Plug>(easymotion-next)
  "map  N <Plug>(easymotion-prev)
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'  
  noremap <silent> ' :call IncSearch()<CR>
  
  " browse
  noremap <silent> <Leader>e :CocCommand explorer<CR>
  noremap <Leader>a :call GitAdd()<CR>

  noremap <silent> <Leader>g :GFiles?<cr>
  tnoremap <Leader>g <C-c>
  "Plug 'airblade/vim-gitgutter'
  Plug 'thaerkh/vim-workspace'
  noremap <leader>s :ToggleWorkspace<CR>

  Plug 'zefei/vim-wintabs'
  "map <Tab> <Plug>(wintabs_previous)
  map <S-Tab> <Plug>(wintabs_next)
  map <C-w> <Plug>(wintabs_close)
  
  Plug 'morhetz/gruvbox'
  Plug 'honza/vim-snippets'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  nnoremap <C-f> <C-c>:Ag<Space>
  vnoremap <C-f> "hy<C-c>:Ag<Space><C-r>h<CR>
  inoremap <C-f> <C-c>:Ag<Space>
  tnoremap <C-f> <C-c>
  cnoremap <C-f> <C-c>
  noremap <C-t> <C-c>:Files<CR>
  vnoremap <C-t> "hy<C-c>:Files<CR><C-\><C-n>"hpi
  inoremap <C-t> <C-c>:Files<CR>
  tnoremap <C-t> <C-c>
  
  "Plug 'iberianpig/tig-explorer.vim'
  "" open tig with current file
  "nnoremap <Leader>G :tabnew<CR>:TigOpenCurrentFile<CR>
  "" open tig with Project root path
  "nnoremap <Leader>g :tabnew<CR>:TigOpenProjectRootDir<CR>
  "tmap <Leader>g <C-\><C-n>:tabclose<CR>
  "" open tig grep
  ""nnoremap <Leader>g :TigGrep<CR>
  "" resume from last grep
  ""nnoremap <Leader>r :TigGrepResume<CR>
  "" open tig grep with the selected word
  ""vnoremap <Leader>g y:TigGrep<Space><C-R>"<CR>
  "" open tig grep with the word under the cursor
  ""nnoremap <Leader>cg :<C-u>:TigGrep<Space><C-R><C-W><CR>
  "" open tig blame with current file
  "nnoremap <Leader>b :TigBlame<CR>
  "tnoremap <Leader>b :q<CR>

  "Plug 'rbgrouleff/bclose.vim'
  Plug 'scrooloose/nerdcommenter'
  nmap <Leader>/ <plug>NERDCommenterToggle
  vmap <Leader>/ <plug>NERDCommenterToggle<C-c>gv=gv
  
  Plug 'tpope/vim-surround'
  nmap m ysiw
  nmap M ds

  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-abolish'
call plug#end()

"ag
"if executable('ag')
"cnoreabbrev ag Ag
"endif

" nerdtree
set splitright
autocmd FileType coc-explorer let t:explorer_winnr = bufwinnr('%')
"autocmd SessionLoadPost * call OpenExplorer()
"function! OpenExplorer()
  "if !exists('t:explorer_winnr') && bufwinnr('%') == 1 
    ":CocCommand explorer
  "endif
"endfunction

"
function! GitAdd()
  :! git add %
  if exists('t:explorer_winnr')
    :1wincmd w
    :normal R
  endif
endfunction

autocmd BufWinEnter * call PreventBuffersInExplorer()

function! PreventBuffersInExplorer()
  if bufname('#') =~ 'coc-explorer' && bufname('%') !~ 'coc-explorer'
   \ && exists('t:explorer_winnr') && bufwinnr('%') == t:explorer_winnr
   \ && &buftype == '' 
    let bufnum = bufnr('%')
    close
    exe 'b ' . bufnum
    :CocCommand explorer
  endif
endfunction

autocmd VimLeave * if exists('t:explorer_winnr') && bufname(winbufnr(t:explorer_winnr)) =~# 'coc-explorer' | execute t:explorer_winnr.'wincmd c' | endif  | :tabonly | :CloseHiddenBuffers

"workspace save session
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave = 0
let g:workspace_undodir= $HOME . '/.vim/undodir/'
set undofile

"vim-wintabs
set sessionoptions+=globals

"vim-colorschemes syntax
set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme gruvbox
hi! Normal ctermbg=NONE guibg=NONE
"hi CursorLine ctermbg=8 ctermfg=15 "8 = dark gray, 15 = white
"hi Cursor ctermbg=15 ctermfg=8

"coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>' 
let g:coc_global_extensions = ['coc-explorer', 'coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-json', 'coc-yaml',  'coc-snippets', 'coc-vetur', 'coc-solargraph']
command! -nargs=0 Format :call CocAction('format')


" fzf
autocmd TermOpen,BufEnter term://* startinsert
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }

" fzf.vim
" Files! // ! for full screen
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

"command! -bang -nargs=* Ag
      "\ call fzf#vim#ag(<q-args>,
      "\                 <bang>0)
command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                         fzf#vim#with_preview('right:45%'),
      \                 <bang>0)
" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, <bang>0)


" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'

" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Function to create the custom floating window
function! FloatingFZF()
  " creates a scratch, unlisted, new, empty, unnamed buffer
  " to be used in the floating window
  let buf = nvim_create_buf(v:false, v:true)

  " 90% of the height
  let height = float2nr(&lines * 0.9)
  " 60% of the height
  let width = float2nr(&columns * 0.9)
  " horizontal position (centralized)
  let horizontal = float2nr((&columns - width) / 2)
  " vertical position (one line down of the top)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height
        \ }

  " open the new window, floating, and enter to it
  call nvim_open_win(buf, v:true, opts)
endfunction

"incsearch
function IncSearch()
call incsearch#go(<SID>config_easyfuzzymotion())
:let @/ = ""
endfunction

function! s:config_easyfuzzymotion(...) abort
return extend(copy({
     \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
     \   'keymap': {"\<CR>": '<Over>(easymotion)'},
     \   'is_expr': 1,
     \   'is_stay': 0
     \ }), get(a:, 1, {}))
endfunction

"if'fff'asdf fff" 'dfasbbb' {adsfssffffsdfafffff)  aaaa \dsfa\  /fasdf/ <asdfasdff  fsavdf>asdfadsf<dfasdf>
"vi(text obj) va
"di"
"da"
"dw
"
"delete diw
"replace ciw cw 
"visual viw
