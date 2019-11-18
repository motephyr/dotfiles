"if'fff'asdf fff" 'dfasbbb' {adsfssffffsdfafffff)  aaaa \dsfa\  /fasdf/ <asdfasdff  fsavdf>asdfadsf<dfasdf>
"vi(text obj) va
"di"
"da"
"dw
"
"delete diw
"replace ciw cw 
"visual viw
let mapleader = " "

call plug#begin()

  " search
  " Plug 'fntlnz/atags.vim' " file tags generating with ctags
  Plug 'easymotion/vim-easymotion' " ;s ;w ;L / ;f
  noremap <Leader>a <Esc>:Ag<Space>
  map  ' <Plug>(easymotion-bd-f)
  nmap ' <Plug>(easymotion-overwin-f)
  imap <Leader>' <c-g>u<C-o>'

  Plug 'haya14busa/incsearch-easymotion.vim'
  Plug 'haya14busa/incsearch.vim'
  noremap <silent> / :call IncSearch()<CR>
  
  " browse
  Plug 'scrooloose/nerdtree'
  noremap <Leader>e :call ToggleNerdTree()<CR>

  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'airblade/vim-gitgutter'
  Plug 'thaerkh/vim-workspace'
  noremap <leader>s :ToggleWorkspace<CR>

  Plug 'zefei/vim-wintabs'
  "map <Tab> <Plug>(wintabs_previous)
  map <S-Tab> <Plug>(wintabs_next)

  Plug 'flazz/vim-colorschemes'
  Plug 'honza/vim-snippets'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  noremap <C-t> <Esc>:Files<CR>
  inoremap <C-t> <Esc>:Files<CR>
  tnoremap <C-t> <C-c>

  Plug 'iberianpig/tig-explorer.vim'
  " open tig with current file
  nnoremap <Leader>T :tabnew<CR>:TigOpenCurrentFile<CR>
  " open tig with Project root path
  nnoremap <Leader>t :tabnew<CR>:TigOpenProjectRootDir<CR>
  tmap <Leader>t <Esc>:q<CR>
  " open tig grep
  nnoremap <Leader>g :TigGrep<CR>
  " resume from last grep
  nnoremap <Leader>r :TigGrepResume<CR>
  " open tig grep with the selected word
  vnoremap <Leader>g y:TigGrep<Space><C-R>"<CR>
  " open tig grep with the word under the cursor
  nnoremap <Leader>cg :<C-u>:TigGrep<Space><C-R><C-W><CR>
  " open tig blame with current file
  nnoremap <Leader>b :TigBlame<CR>

  Plug 'rbgrouleff/bclose.vim'
  Plug 'scrooloose/nerdcommenter'
  nmap m <plug>NERDCommenterToggle
  vmap m <plug>NERDCommenterToggle<Esc>gv=gv
  
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
call plug#end()


"ag
if executable('ag')
  cnoreabbrev ag Ag
endif

"easymotion <Leader>f{char} to move to {char}
let g:EasyMotion_smartcase = 1

"incsearch
function IncSearch()
  :let @/ = ""
  call incsearch#go(<SID>config_easyfuzzymotion())
endfunction

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 1,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

" nerdtree
set splitright
let g:NERDTreeMouseMode=2
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
"nnoremap <silent> <Leader>w :NERDTreeFind<cr>
function NotNerdTreePane()
  return bufname('%') !~# 'NERD_tree_' && winnr("$") > 1 && strlen(expand('%')) > 0 && &modifiable && exists("g:NERDTree")
endfunction

function ToggleNerdTree()
  if g:NERDTree.IsOpen() 
    :NERDTreeClose
  else 
    :NERDTreeFind
  endif
endfunction

autocmd BufEnter *  if (NotNerdTreePane() && g:NERDTree.IsOpen()) | NERDTreeFind | wincmd p | endif
autocmd SessionLoadPost * if (NotNerdTreePane() && !g:NERDTree.IsOpen()) | NERDTreeFind | wincmd p | endif 
autocmd VimLeave * NERDTreeClose

"git
set updatetime=500

"workspace save session
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave = 0
let g:workspace_undodir= $HOME . '/.vim/undodir/'
set noswapfile
set undofile

"vim-wintabs
set sessionoptions+=globals

"vim-colorschemes syntax
set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme deus
let g:deus_termcolors=256
hi! Normal ctermbg=NONE guibg=NONE

"coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>' 
let g:coc_global_extensions = ['coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-json', 'coc-yaml', 'coc-solargraph', 'coc-snippets']

" fzf
autocmd TermOpen,BufEnter term://* startinsert
let g:fzf_history_dir = '~/.local/share/fzf-history'

" with fzf.vim

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

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%'),
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
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

