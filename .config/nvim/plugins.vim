"if'fff'asdf fff" 'dfasdfasdf bbb' {asdfasdf asdfasdf} [fasdfafd asdfasd] (asdfa ffff)   \adsfa\  /fasdf/ <asdfasdff  fsavdf>asdfadsf<dfasdf>
"vi(text obj) va
"ci
"di

call plug#begin()

  " search
  " Plug 'ctrlpvim/ctrlp.vim'
  Plug 'mileszs/ack.vim'
  " Plug 'fntlnz/atags.vim' " file tags generating with ctags
  Plug 'easymotion/vim-easymotion' " ;s ;w ;L / ;f

  " browse
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-fugitive'
  Plug 'thaerkh/vim-workspace'
  Plug 'flazz/vim-colorschemes'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

call plug#end()

let mapleader = " "

"ack for ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev ag Ag

"easymotion <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" nerdtree
set splitright
let g:NERDTreeMouseMode=3
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
noremap <Leader>t <Esc>:NERDTreeToggle<cr>
nnoremap <silent> <Leader>r :NERDTreeFind<cr>
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimLeave * NERDTreeClose

"workspace save session
nnoremap <leader>s :ToggleWorkspace<CR>
let g:workspace_session_directory = $HOME . '/.vim/sessions/'
let g:workspace_autosave = 0
let g:workspace_undodir= $HOME . '/.vim/undodir/'

"vim-colorschemes syntax
syntax on
colorscheme deus
highlight Normal ctermbg=black

"coc
let g:coc_global_extensions = ['coc-emoji', 'coc-eslint', 'coc-prettier','coc-tsserver','coc-json', 'coc-yaml']

" fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
let g:fzf_history_dir = '~/.local/share/fzf-history'

" with fzf.vim
noremap <C-t> <Esc>:Files<CR>
inoremap <C-t> <Esc>:Files<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-i': 'split',
  \ 'ctrl-s': 'vsplit' }

" fzf.vim
"
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

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


"global
noremap <Leader>n <Esc>:set invnu<cr>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
