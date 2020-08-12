let mapleader = " "

call plug#begin()
  Plug 'ianding1/leetcode.vim'
  let g:leetcode_solution_filetype = 'javascript'
  let g:leetcode_browser = 'chrome'

  Plug 'ybian/smartim'
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
  noremap <silent> <Leader>e :CocCommand explorer --no-focus<CR>
  noremap <silent> << :call GitAdd()<CR>
  noremap <silent> >> :call GitRm()<CR>

  "Plug 'airblade/vim-gitgutter'
  Plug 'mhinz/vim-signify'
  Plug 'thaerkh/vim-workspace'
  noremap <leader>s :ToggleWorkspace<CR>

  Plug 'zefei/vim-wintabs'
  map <M-[> <Plug>(wintabs_previous)
  map <M-]> <Plug>(wintabs_next)
  map <C-w> <Plug>(wintabs_close)

  Plug 'tomasiser/vim-code-dark'
  "Plug 'morhetz/gruvbox'
  Plug 'honza/vim-snippets'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? '<Enter>' :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()

  "inoremap <silent><expr> <S-TAB>
        "\ pumvisible() ? '<Up>' :
        "\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        "\ <SID>check_back_space() ? "\<TAB>" :
        "\ coc#refresh()



	"inoremap <silent><expr> <cr> pumvisible() ? "<Esc>a<CR>"
				"\: "<CR>"

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'yuki-ycino/fzf-preview.vim',  { 'tag': 'version_1' }

  nnoremap <C-f> <C-c>:FzfPreviewProjectGrep<Space>''<left>
  vnoremap <C-f> "hy<C-c>:FzfPreviewProjectGrep<Space>'<C-r>h'<left>
  inoremap <C-f> <C-c>:FzfPreviewProjectGrep<Space>''<left>
  tnoremap <C-f> <C-c>
  cnoremap <C-f> <C-c>
  noremap <C-t> <C-c>:FzfPreviewProjectMruFiles<CR>
  vnoremap <C-t> "hy<C-c>:FzfPreviewProjectMruFiles<CR><C-\><C-n>"hpi
  inoremap <C-t> <C-c>:FzfPreviewProjectMruFiles<CR>
  tnoremap <C-t> <C-c>

  noremap <C-g> <C-c>:FzfPreviewGitStatus<CR>
  inoremap <C-g> <C-c>:FzfPreviewGitStatus<CR>
  tnoremap <C-g> <C-c>

  Plug 'preservim/nerdcommenter'
  nmap <M-/> <plug>NERDCommenterToggle
  vmap <M-/> <plug>NERDCommenterTogglegv=gv

  "Plug 'tpope/vim-surround'
  "nmap m ysiw
  "nmap M ds

  "Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-abolish'
  Plug 'whiteinge/diffconflicts'
  noremap <Leader>c :DiffConflicts<CR>
  Plug 'jparise/vim-graphql'
call plug#end()

"ag
"if executable('ag')
"cnoreabbrev ag Ag
"endif

autocmd FileType coc-explorer let t:explorer_winnr = bufwinnr('%')
"autocmd SessionLoadPost * call OpenExplorer()
"function! OpenExplorer()
"if !exists('t:explorer_winnr') && bufwinnr('%') == 1 
":CocCommand explorer
"endif
"endfunction

"
function! GitAdd()
  if bufname('%') !~ 'coc-explorer'
    :! git add %
    if exists('t:explorer_winnr')
      :1wincmd w
      :normal R
    endif
  endif
endfunction

function! GitRm()
  if bufname('%') !~ 'coc-explorer'
    :! git reset -- %
    if exists('t:explorer_winnr')
      :1wincmd w
      :normal R
    endif
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
    autocmd TermOpen * nnoremap <buffer><ScrollWheelUp> ik
    autocmd TermOpen * nnoremap <buffer><ScrollWheelDown> ij
  augroup end
endif

au BufNewFile,BufRead *.ejs set filetype=html

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

"For tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme codedark
hi! Normal ctermbg=NONE guibg=NONE 
"ctermfg=white  guifg=white
hi! Search ctermbg=white guibg=white ctermfg=black guifg=black
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi TabLineSel cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

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

nnoremap <silent> <LeftMouse> <LeftMouse>:call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) < 0)
    call CocActionAsync('doHover')
  endif
endfunction

nmap <M-.> <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

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
