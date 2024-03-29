call plug#begin()

  Plug 'ybian/smartim'
  Plug 'antoinemadec/FixCursorHold.nvim'
  noremap <silent> <C-e> :call ToggleVExplorer()<CR>
  " browse
  noremap <silent> <M-a> :call GitAdd()<CR>
  noremap <silent> <M-r> :call GitReset()<CR>
  noremap <silent> <M-d> :call GitDiscard()<CR>

  "Plug 'airblade/vim-gitgutter'
  Plug 'mhinz/vim-signify'
  " Plug 'kyazdani42/nvim-tree.lua', {'commit': '0136801444cfb2d85ae956d8c23c79f4a9f26b90'}
  Plug 'kyazdani42/nvim-tree.lua'
  "Plug 'tpope/vim-fugitive'

  " Plug 'thaerkh/vim-workspace'
  Plug 'rmagatti/auto-session'
  " noremap <leader>s :ToggleWorkspace<CR>

  Plug 'tomasiser/vim-code-dark'
  "Plug 'morhetz/gruvbox'
  Plug 'honza/vim-snippets'

  " Plug 'neoclide/coc.nvim', {'commit': '0e3a24b5351fbda44d884375bc48a12a97f75ffd'}
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " let g:coc_global_extensions = [ 'coc-eslint',
  "       \ 'coc-tsserver',
  "       \ 'coc-json',
  "       \ 'coc-yaml',
  "       \ 'coc-snippets',
  "       \ 'coc-docthis',
  "       \ 'coc-vimlsp',
  "       \ 'coc-angular',
  "       \ 'coc-omnisharp',
  "       \ 'coc-html',
  "       \ 'coc-go',
  "       \ 'coc-vetur']

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
  " inoremap <silent><expr> <Space>
  "       \ pumvisible() ? '<Esc>' :' '

  " inoremap <silent><expr> <cr> pumvisible() ? "<Esc>i<CR>" : "<CR>"

  " nmap <C-]> :echo "tags"<CR>
  if has('nvim-0.5')
    set tagfunc=CocTagFunc
    "set signcolumn=number
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

  nmap <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : 'i<CR>'
  xmap <CR> <Plug>(coc-codeaction-selected)

  Plug 'tpope/vim-repeat'
  Plug 'inkarkat/vim-visualrepeat'

  map <silent> <M-e> <Plug>(coc-refactor)
  noremap <silent><nowait> <M-s> :<C-u>CocFix<cr>
  map <M-c> :CocCommand docthis.documentThis<CR>
  noremap <silent><nowait> <M-m> :<C-u>CocDiagnostic<cr>
  map <silent> <M-,> <Plug>(coc-diagnostic-prev)
  map <silent> <M-.> <Plug>(coc-diagnostic-next)

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  Plug 'motephyr/fzf-preview.vim',  { 'branch': 'motephyr' }

  nnoremap <C-f> <C-c>:FzfPreviewProjectGrep --ignore-case<Space>''<left>
  vnoremap <C-f> "hy<C-c>:FzfPreviewProjectGrep --ignore-case<Space>'<C-r>h'<left>
  inoremap <C-f> <C-c>:FzfPreviewProjectGrep --ignore-case<Space>''<left>
  cnoremap <C-f> <C-c>
  tnoremap <C-f> <Esc><C-\><C-n>
  nnoremap <C-t> <C-c>:FzfPreviewFromResources project_mru git<CR>
  vnoremap <C-t> "hy<C-c>:FzfPreviewFromResources project_mru git<CR><C-\><C-n>"hpi
  inoremap <C-t> <C-c>:FzfPreviewFromResources project_mru git<CR>
  tnoremap <C-t> <Esc><C-\><C-n>

  noremap <C-g> <C-c>:call OpenFzfPreviewGitStatus()<CR>
  inoremap <C-g> <C-c>:call OpenFzfPreviewGitStatus()<CR>
  tnoremap <C-g> <Esc><C-\><C-n>

  Plug 'tomtom/tcomment_vim'

  "Plug 'tpope/vim-surround'
  "nmap m ysiw
  "nmap M ds

  Plug 'jparise/vim-graphql'
  Plug 'posva/vim-vue'
  Plug 'motephyr/vim-horizonbar'
  " Plug 'eliba2/vim-node-inspect'
  "
  " nnoremap <silent><F4> :NodeInspectStart<cr>
  " nnoremap <silent><F5> :NodeInspectRun<cr>
  " nnoremap <silent><F6> :NodeInspectConnect("127.0.0.1:9229")<cr>
  " nnoremap <silent><F7> :NodeInspectStepInto<cr>
  " nnoremap <silent><F8> :NodeInspectStepOver<cr>
  " nnoremap <silent><F9> :NodeInspectToggleBreakpoint<cr>
  " nnoremap <silent><F10> :NodeInspectStop<cr>

  noremap <Leader>d :vertical diffsplit <C-r>% \| windo set wrap<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>

  " Plug 'APZelos/blamer.nvim'
  " let g:blamer_enabled = 1
  " let g:blamer_show_in_visual_modes = 0
  " search
  " Plug 'fntlnz/atags.vim' " file tags generating with ctags
  "
  " Plug 'easymotion/vim-easymotion'
  " cnoremap <expr> <TAB> getcmdtype()=='/' ?
  "       \ '<CR>:silent! call EasyMotion#Search(0, 2, 0)<CR>' :
  "       \ "<C-z>"
  " let g:EasyMotion_do_mapping = 0
  " let g:EasyMotion_smartcase = 1
  " nmap <TAB> <Plug>(easymotion-overwin-f2)
  " vmap <TAB> <Plug>(easymotion-f2)
  "
  " Plug 'ianding1/leetcode.vim'
  " let g:leetcode_solution_filetype = 'javascript'
  " let g:leetcode_browser = 'chrome'
  "
  " Plug 'tpope/vim-abolish'
  " vnoremap <Leader>h "hy:.,$Subvert/<C-r>h{,s}/{,s}/gc<left><left><left><left><left><left><left>
  "
  " Plug 'whiteinge/diffconflicts'
  " noremap <Leader>c :DiffConflicts<CR>
  "
  " Plug 'rhysd/devdocs.vim'
  " nnoremap <silent> K "hyiw:DevDocs <C-r>h<CR>
call plug#end()


set statusline=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%{(mode()=='c')?'\ \ \ \ \ \ \ \ \ ':''}
set statusline+=%{(mode()=='t')?'\ \ \ \ \ \ \ \ \ ':''}
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%{(index(['','coc-explorer'],&filetype)<0)?horizonbar#ScrollBarWidth(horizonbar#BarWidth()+2):''}
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

augroup plugin | au!
  " autocmd CursorHold * silent call <SID>show_documentation()
  autocmd User CocGitStatusChange call horizonbar#GetDiffList()
  autocmd User CocGitStatusChange :NvimTreeRefresh
  autocmd VimLeavePre * call TerminalAndExplorerAllClose()
augroup END

function! TerminalAndExplorerAllClose()
  let t = range(1, tabpagenr('$'))
  exe 'tabn 1'
  for tabnumber in t
    let b = reverse(filter(range(1, winnr('$')), 'getwinvar(v:val, "&buftype", "ERROR") == "terminal" || getwinvar(v:val, "&filetype", "ERROR") == "coc-explorer" || getwinvar(v:val, "&filetype", "ERROR") == "NvimTree"'))
    if len(b) > 0
      for pane in b
        exe pane.'wincmd w'
        exe 'bdelete!'
      endfor
    endif
    exe 'tabnext'
  endfor
endfunc

"workspace save session
" let g:workspace_session_directory = $HOME . '/.vim/sessions/'
" let g:workspace_autosave = 0
" let g:workspace_autosave_untrailspaces = 0
" let g:workspace_autosave_untrailtabs = 0
" let g:workspace_undodir= $HOME . '/.vim/undodir/'
" let g:workspace_create_new_tabs = 1
let g:auto_session_root_dir=$HOME . '/.vim/sessions/'
set undodir=~/.vim/undodir/
set undofile

"set sessionoptions+=globals

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
hi Folded ctermfg=grey guifg=grey

function! GitAdd() abort
  if bufname('%') !~ 'coc-explorer'
    exe 'silent ! git add %'
    :doautocmd User CocGitStatusChange
  endif
endfunction

function! GitReset() abort
  if bufname('%') !~ 'coc-explorer'
    exe 'silent ! git reset -- %'
    :doautocmd User CocGitStatusChange
  endif
endfunction

function! GitDiscard() abort
  if bufname('%') !~ 'coc-explorer'
    exe 'silent ! git checkout -- %'
    :doautocmd User CocGitStatusChange
  endif
endfunction

"fzf
augroup fzf_preview
  autocmd!
  autocmd User fzf_preview#initialized call s:fzf_preview_settings()
augroup END

function! s:fugitive_add(paths) 
  for path in a:paths
    exe 'silent ! git add ' . path
  endfor
  :doautocmd User CocGitStatusChange
  call OpenFzfPreviewGitStatus()
  " call feedkeys("i", "n")
endfunction

function! s:fugitive_reset(paths) 
  for path in a:paths
    exe 'silent ! git reset -- ' . path
  endfor
  :doautocmd User CocGitStatusChange
  call OpenFzfPreviewGitStatus()
  " call feedkeys("i", "n")
endfunction

function! s:fugitive_discard(paths) 
  for path in a:paths
    exe 'silent ! git checkout -- ' . path
  endfor
  :doautocmd User CocGitStatusChange
  call OpenFzfPreviewGitStatus()
  " call feedkeys("i", "n")
endfunction

function! OpenFzfPreviewGitStatus()
  execute 'FzfPreviewGitStatus -processors=g:fzf_preview_fugitive_processors'
endfunction

function! s:fzf_preview_settings() abort
  let g:fzf_preview_fzf_preview_window_option = 'right:50%'

  let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g "!*.git*"'
  let g:fzf_preview_grep_cmd = 'rg --hidden --line-number --no-heading -g "!*.git*"'

  let g:fzf_preview_custom_default_processors = fzf_preview#resource_processor#get_default_processors()

  let g:fzf_preview_custom_default_processors['ctrl-t'] = function('fzf_preview#resource_processor#tabedit')
  let g:fzf_preview_custom_default_processors['ctrl-x'] = function('fzf_preview#resource_processor#split')
  let g:fzf_preview_custom_default_processors['ctrl-s'] =  function('fzf_preview#resource_processor#vsplit') 
  let g:fzf_preview_fugitive_processors = fzf_preview#resource_processor#get_processors()
  let g:fzf_preview_fugitive_processors['alt-a'] = function('s:fugitive_add')
  let g:fzf_preview_fugitive_processors['alt-r'] = function('s:fugitive_reset')
  let g:fzf_preview_fugitive_processors['alt-d'] = function('s:fugitive_discard')
endfunction

"coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>' 

command! -nargs=0 Format :call Format()

function Format()
    :call CocAction('format')
    if index(["javascript", "typescript", "typescriptreact", "javascriptreact", "typescript.tsx"], &filetype) >= 0
      :CocCommand eslint.executeAutofix
    endif
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    "execute 'h '.expand('<cword>')
  elseif index(["coc-explorer", "NetrwTreeListing", "NvimTree"],bufname('%')) < 0 && mode() == 'n' && &filetype != ''
    call CocActionAsync('doHover')
  endif
endfunction
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
