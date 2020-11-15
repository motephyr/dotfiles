let g:lua_tree_side = 'left' "left by default
let g:lua_tree_width = 33 "30 by default
let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:lua_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:lua_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:lua_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:lua_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:lua_tree_allow_resize = 1 "0 by default, will not resize the tree when opening a file
let g:lua_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" You can edit keybindings be defining this variable
" You don't have to define all keys.
" NOTE: the 'edit' key will wrap/unwrap a folder and open a file
let g:lua_tree_bindings = {
    \ 'edit':            ['<CR>', 'o', '<Space>'],
    \ 'edit_vsplit':     's',
    \ 'edit_split':      'i',
    \ 'edit_tab':        't',
    \ 'toggle_ignored':  'I',
    \ 'toggle_dotfiles': 'H',
    \ 'refresh':         'R',
    \ 'preview':         '<Tab>',
    \ 'cd':              '<C-]>',
    \ 'create':          'a',
    \ 'remove':          'd',
    \ 'rename':          'r',
    \ 'cut':             'x',
    \ 'copy':            'c',
    \ 'paste':           'p',
    \ 'prev_git_item':   '[c',
    \ 'next_git_item':   ']c',
    \ }

" Disable default mappings by plugin
" Bindings are enable by default, disabled on any non-zero value
" let lua_tree_disable_keybindings=1

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:lua_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "[~]",
    \   'staged': "[+]",
    \   'unmerged': "[=]",
    \   'renamed': "[➜]",
    \   'untracked': "[✭]",
    \   'deleted': "[_]"
    \   }
    \ }
augroup CursorLine
  au!
  au BufEnter * if bufname('%') =~ 'LuaTree' | setlocal cursorline | exe 'LuaTreeRefresh' | endif
augroup END

autocmd FileType LuaTree let t:explorer_winnr = bufwinnr('%')
autocmd VimLeavePre * if exists('t:explorer_winnr') && bufname(winbufnr(t:explorer_winnr)) =~# 'LuaTree' | execute t:explorer_winnr.'wincmd c' | endif 

autocmd BufWinEnter * call PreventBuffersInExplorer()

function! PreventBuffersInExplorer()
  if bufname('%') !~ 'LuaTree'
        \ && exists('t:explorer_winnr') && bufwinnr('%') == t:explorer_winnr
        \ && &buftype == '' 
    let bufnum = bufnr('%')
    close
    exe 'b ' . bufnum
    :LuaTreeOpen
  endif
endfunction

let g:coc_global_extensions = ['coc-eslint',
      \ 'coc-tsserver']
if substitute(system('uname'), '\n', '', '') != 'Linux'
  let g:coc_global_extensions = g:coc_global_extensions + [
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-snippets',
      \ 'coc-vetur',
      \ 'coc-docthis',
      \ 'coc-vimlsp',
      \ 'coc-angular',
      \ 'coc-omnisharp',
      \ 'coc-html']
endif