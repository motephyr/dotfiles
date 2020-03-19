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
  Plug 'yuki-ycino/fzf-preview.vim'

  nnoremap <C-f> <C-c>:FzfPreviewProjectGrep<Space>
  vnoremap <C-f> "hy<C-c>:FzfPreviewProjectGrep<Space><C-r>h<CR>
  inoremap <C-f> <C-c>:FzfPreviewProjectGrep<Space>
  tnoremap <C-f> <C-c>
  cnoremap <C-f> <C-c>
  noremap <C-t> <C-c>:FzfPreviewProjectFiles<CR>
  vnoremap <C-t> "hy<C-c>:FzfPreviewProjectFiles<CR><C-\><C-n>"hpi
  inoremap <C-t> <C-c>:FzfPreviewProjectFiles<CR>
  tnoremap <C-t> <C-c>

  noremap <C-g> <C-c>:FzfPreviewGitStatus<CR>
  tnoremap <C-g> <C-c>

  Plug 'sCRooloose/nerdcommenter'
  nmap <Leader>/ <plug>NERDCommenterToggle
  vmap <Leader>/ <plug>NERDCommenterToggle<C-c>gv=gv

  Plug 'tpope/vim-surround'
  nmap m ysiw
  nmap M ds

  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-abolish'
  Plug 'whiteinge/diffconflicts'
  noremap <Leader>c :DiffConflicts<CR>
  noremap <expr> <Leader>g bufname('%') !~ 'coc-explorer' ? ':vsplit % \| term git diff HEAD --color %<CR>' : ''
  tmap <Leader>g <C-\><C-n>:bdelete!<CR>
  noremap <expr> <Leader>b bufname('%') !~ 'coc-explorer' ? ':tabnew % \| term tig blame %<CR>' : ''
  tmap <Leader>b <C-\><C-n>:bdelete!<CR>
call plug#end()

"ag
"if executable('ag')
"cnoreabbrev ag Ag
"endif

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
if has('nvim')
  augroup terminal_setup | au!
    autocmd TermOpen,BufEnter term://* startinsert
    autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
    autocmd TermOpen * nnoremap <buffer><ScrollWheelUp> ki
    autocmd TermOpen * nnoremap <buffer><ScrollWheelDown> ji
  augroup end
endif
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css

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

"fzf
augroup fzf_preview
  autocmd!
  autocmd User fzf_preview#initialized call s:fzf_preview_settings()
augroup END

function! s:fzf_preview_settings() abort
  let g:fzf_preview_filelist_command = 'ag --hidden --ignore .git -g ""'
  let g:fzf_preview_custom_default_processors = fzf_preview#resource_processor#get_default_processors()

  let g:fzf_preview_custom_default_processors['ctrl-t'] = function('fzf_preview#resource_processor#tabedit')
  let g:fzf_preview_custom_default_processors['ctrl-i'] = function('fzf_preview#resource_processor#split')
  let g:fzf_preview_custom_default_processors['ctrl-s'] =  function('fzf_preview#resource_processor#vsplit') 

endfunction

"coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>' 
let g:coc_global_extensions = ['coc-explorer', 'coc-emoji', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-json', 'coc-yaml',  'coc-snippets', 'coc-vetur', 'coc-solargraph']
command! -nargs=0 Format :call CocAction('format')

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
