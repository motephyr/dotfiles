call plug#begin()

  Plug 'ybian/smartim'

  " browse
  noremap <silent> <Leader>e :CocCommand explorer --no-focus<CR>
  noremap <silent> <M-a> :call GitAdd()<CR>
  noremap <silent> <M-r> :call GitRm()<CR>
  noremap <silent> <M-c> :call GitDiscard()<CR>

  "Plug 'airblade/vim-gitgutter'
  Plug 'mhinz/vim-signify'
  "Plug 'tpope/vim-fugitive'

  noremap <expr> <Leader>t bufname('%') !~ 'coc-explorer' ? '<Esc>:tabnew % \| term tig<CR>' : ''
  noremap <expr> <Leader>f bufname('%') !~ 'coc-explorer' ? '<Esc>:tabnew % \| term tig <C-r>%<CR>' : ''
  noremap <expr> <Leader>g bufname('%') !~ 'coc-explorer' ? '<Esc>:vsplit % \| term git diff HEAD %<CR>' : ''
  "noremap <expr> <Leader>g bufname('%') !~ 'coc-explorer' ? '<Esc>:vertical Git diff HEAD %<CR>' : ''
  "noremap <expr> <Leader>g bufname('%') !~ 'coc-explorer' ? '<Esc>:vnew \| r !git diff HEAD <C-r>%<CR>' : ''

  Plug 'thaerkh/vim-workspace'
  noremap <leader>s :ToggleWorkspace<CR>

  Plug 'tomasiser/vim-code-dark'
  "Plug 'morhetz/gruvbox'
  Plug 'honza/vim-snippets'

  Plug 'neoclide/coc.nvim', {'commit': '0e3a24b5351fbda44d884375bc48a12a97f75ffd'}

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? '<Down>' :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ "\<TAB>"
        "\ <SID>check_back_space() ? "\<TAB>" :
        "\ coc#refresh()

  inoremap <silent><expr> <S-TAB>
        \ pumvisible() ? '<Up>' :
        \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
        \ "\<C-D>"
        "\ <SID>check_back_space() ? "\<TAB>" :
        "\ coc#refresh()

  inoremap <silent><expr> <ScrollWheelUp>
        \ pumvisible() ? '<Esc>' : '<ScrollWheelUp>'
  inoremap <silent><expr> <ScrollWheelDown>
        \ pumvisible() ? '<Esc>' :'<ScrollWheelDown>'
  inoremap <silent><expr> <Space>
        \ pumvisible() ? ' <left>' :' '
  
  " inoremap <silent><expr> <cr> pumvisible() ? "<Esc>i<CR>" : "<CR>"

  " nmap <C-]> :echo "tags"<CR>
  if has('nvim-0.5')
    set tagfunc=CocTagFunc
    set signcolumn=number
  endif
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap 'f v<Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  nmap "f v<Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  nmap 'c v<Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  nmap "c v<Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  nmap <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : 'viw<Plug>(coc-codeaction-selected)'
  xmap <CR> <Plug>(coc-codeaction-selected)

  nmap <silent> <C-LeftMouse> <LeftMouse>i
  imap <silent> <C-LeftMouse> <LeftMouse>i
  vmap <silent> <C-LeftMouse> <LeftMouse>i

  nmap <silent> . :call <SID>show_documentation()<CR>
  nmap <silent> <M-e> <Plug>(coc-refactor)
  nnoremap <silent><nowait> <M-s> :<C-u>CocFix<cr>
  nmap <M-d> :CocCommand docthis.documentThis<CR>
  nnoremap <silent><nowait> <M-m> :<C-u>CocDiagnostic<cr>
  nmap <silent> <M-,> <Plug>(coc-diagnostic-prev)
  nmap <silent> <M-.> <Plug>(coc-diagnostic-next)

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  Plug 'yuki-ycino/fzf-preview.vim',  { 'tag': 'version_1' }

  nnoremap <C-f> <C-c>:FzfPreviewProjectGrep<Space>''<left>
  vnoremap <C-f> "hy<C-c>:FzfPreviewProjectGrep<Space>'<C-r>h'<left>
  inoremap <C-f> <C-c>:FzfPreviewProjectGrep<Space>''<left>
  cnoremap <C-f> <C-c>
  tnoremap <C-f> <Esc>
  nnoremap <C-t> <C-c>:FzfPreviewFromResources project_mru git<CR>
  vnoremap <C-t> "hy<C-c>:FzfPreviewFromResources project_mru git<CR><C-\><C-n>"hpi
  inoremap <C-t> <C-c>:FzfPreviewFromResources project_mru git<CR>
  tnoremap <C-t> <Esc>

  noremap <C-g> <C-c>:call OpenFzfPreviewGitStatus()<CR>
  inoremap <C-g> <C-c>:call OpenFzfPreviewGitStatus()<CR>
  tnoremap <C-g> <Esc>

  Plug 'tomtom/tcomment_vim'
  nmap <M-/> <Leader>__
  vmap <M-/> <Leader>__gv=gv

  "Plug 'tpope/vim-surround'
  "nmap m ysiw
  "nmap M ds

  "Plug 'tpope/vim-repeat'
  Plug 'jparise/vim-graphql'
  Plug 'motephyr/vim-horizonbar'
  Plug 'eliba2/vim-node-inspect'

  nnoremap <silent><F4> :NodeInspectStart<cr>
  nnoremap <silent><F5> :NodeInspectRun<cr>
  nnoremap <silent><F6> :NodeInspectConnect("127.0.0.1:9229")<cr>
  nnoremap <silent><F7> :NodeInspectStepInto<cr>
  nnoremap <silent><F8> :NodeInspectStepOver<cr>
  nnoremap <silent><F9> :NodeInspectToggleBreakpoint<cr>
  nnoremap <silent><F10> :NodeInspectStop<cr>

  " search
  " Plug 'fntlnz/atags.vim' " file tags generating with ctags
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  augroup incsearch-easymotion
    autocmd!
    autocmd User IncSearchEnter autocmd! incsearch-easymotion-impl
  augroup END
  augroup incsearch-easymotion-impl
    autocmd!
  augroup END
  function! IncsearchEasyMotion() abort
    autocmd incsearch-easymotion-impl User IncSearchExecute :silent! call EasyMotion#Search(0, 2, 0)
    return "\<CR>"
  endfunction
  let g:incsearch_cli_key_mappings = {
        \   "\/": {
        \       'key': 'IncsearchEasyMotion()',
        \       'noremap': 1,
        \       'expr': 1
        \   }
        \ }


  " Plug 'ianding1/leetcode.vim'
  " let g:leetcode_solution_filetype = 'javascript'
  " let g:leetcode_browser = 'chrome'
  "
  " Plug 'tpope/vim-abolish'
  " vnoremap <Leader>h "hy:.,$Subvert/<C-r>h{,s}/{,s}/gc<left><left><left><left><left><left><left>
  " Plug 'whiteinge/diffconflicts'
  " noremap <Leader>c :DiffConflicts<CR>
  noremap <Leader>d :vertical diffsplit <C-r>% \| windo set wrap<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
  "

  " Plug 'APZelos/blamer.nvim'
  " let g:blamer_enabled = 1
  " let g:blamer_show_in_visual_modes = 0
  Plug 'rhysd/devdocs.vim'
  nnoremap <silent> K "hyiw:DevDocs <C-r>h<CR>
call plug#end()


set statusline=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%{(index(['','coc-explorer'],&filetype)<0)?horizonbar#ScrollBarWidth(horizonbar#BarWidth()):''}
set statusline+=%=
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=\ %Y\                   " short file name
set statusline+=%#CursorIM#     " colour
set statusline+=\ %2l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %{line('$')}
set statusline+=\ Lines\                " percentage


autocmd User CocGitStatusChange call horizonbar#GetDiffList()
nnoremap <M-ScrollWheelUp> <C-u>
nnoremap <M-ScrollWheelDown> <C-d>

let g:coc_global_extensions = ['coc-explorer', 'coc-eslint', 'coc-prettier', 'coc-tsserver', 'coc-json', 'coc-yaml',  'coc-snippets', 'coc-vetur', 'coc-solargraph',  'coc-docthis', 'coc-vimlsp', 'coc-angular']
autocmd FileType coc-explorer let t:explorer_winnr = bufwinnr('%')

autocmd VimLeavePre * if exists('t:explorer_winnr') && bufname(winbufnr(t:explorer_winnr)) =~# 'coc-explorer' | execute t:explorer_winnr.'wincmd c' | endif 
autocmd VimLeave * :tabonly | :CloseHiddenBuffers

"
function! GitAdd() abort
  if bufname('%') !~ 'coc-explorer'
    :! git add %
    :doautocmd User CocGitStatusChange
  endif
endfunction

function! GitRm() abort
  if bufname('%') !~ 'coc-explorer'
    :! git reset -- %
    :doautocmd User CocGitStatusChange
  endif
endfunction

function! GitDiscard() abort
  if bufname('%') !~ 'coc-explorer'
    :! git checkout -- %
    :doautocmd User CocGitStatusChange
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

"workspace save session
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave = 0
let g:workspace_undodir= $HOME . '/.vim/undodir/'
set undofile

set sessionoptions+=globals

"vim-colorschemes syntax
"set termguicolors

"For tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme codedark
hi! Normal ctermbg=NONE guibg=NONE 
"ctermfg=white  guifg=white
hi! Search ctermbg=yellow guibg=yellow ctermfg=black guifg=black
hi! IncSearch ctermbg=darkred guibg=darkred ctermfg=white guifg=white
hi CursorLine cterm=NONE ctermbg=darkred guibg=darkred 
hi TabLineSel cterm=NONE ctermbg=darkred guibg=darkred

"fzf
augroup fzf_preview
  autocmd!
  autocmd User fzf_preview#initialized call s:fzf_preview_settings()
augroup END

function! s:fugitive_add(paths) 
  for path in a:paths
    execute '! git add ' . path
  endfor
  :doautocmd User CocGitStatusChange
  call OpenFzfPreviewGitStatus()
endfunction

function! s:fugitive_reset(paths) 
  for path in a:paths
    execute '! git reset -- ' . path
  endfor
  :doautocmd User CocGitStatusChange
  call OpenFzfPreviewGitStatus()
endfunction

function! s:fugitive_discard(paths) 
  for path in a:paths
    execute '! git checkout -- ' . path
  endfor
  :doautocmd User CocGitStatusChange
  call OpenFzfPreviewGitStatus()
endfunction

function! OpenFzfPreviewGitStatus()
  execute 'FzfPreviewGitStatus -processors=g:fzf_preview_fugitive_processors'
endfunction

function! s:fzf_preview_settings() abort
  let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'
  let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading'

  let g:fzf_preview_custom_default_processors = fzf_preview#resource_processor#get_default_processors()

  let g:fzf_preview_custom_default_processors['ctrl-t'] = function('fzf_preview#resource_processor#tabedit')
  let g:fzf_preview_custom_default_processors['ctrl-i'] = function('fzf_preview#resource_processor#split')
  let g:fzf_preview_custom_default_processors['ctrl-s'] =  function('fzf_preview#resource_processor#vsplit') 
  let g:fzf_preview_fugitive_processors = fzf_preview#resource_processor#get_processors()
  let g:fzf_preview_fugitive_processors['alt-a'] = function('s:fugitive_add')
  let g:fzf_preview_fugitive_processors['alt-r'] = function('s:fugitive_reset')
  let g:fzf_preview_fugitive_processors['alt-c'] = function('s:fugitive_discard')
endfunction

"coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>' 

command! -nargs=0 Format :call CocAction('format')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
