if bufname('%') !~ 'scp'

  let g:nvim_tree_side = 'left' "left by default
  let g:nvim_tree_width = 33 "30 by default
  let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
  let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
  let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
  let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
  let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
  let g:nvim_tree_allow_resize = 1 "0 by default, will not resize the tree when opening a file
  let g:nvim_tree_show_icons = {
      \ 'git': 1,
      \ 'folders': 1,
      \ 'files': 0,
      \ }
  "If 0, do not show the icons for one of 'git' 'folder' and 'files'
  "1 by default, notice that if 'files' is 1, it will only display
  "if nvim-web-devicons is installed and on your runtimepath

  " You can edit keybindings be defining this variable
  " You don't have to define all keys.
  " NOTE: the 'edit' key will wrap/unwrap a folder and open a file
  let g:nvim_tree_bindings = {
      \ 'edit':            ['<CR>', 'o'],
      \ 'edit_vsplit':     's',
      \ 'edit_split':      'x',
      \ 'edit_tab':        't',
      \ 'toggle_ignored':  'I',
      \ 'toggle_dotfiles': 'H',
      \ 'refresh':         'R',
      \ 'preview':         'gp',
      \ 'cd':              '<Space>',
      \ 'create':          'a',
      \ 'remove':          'd',
      \ 'rename':          'r',
      \ 'cut':             '<M-x>',
      \ 'copy':            'c',
      \ 'paste':           'p',
      \ 'prev_git_item':   '[c',
      \ 'next_git_item':   ']c',
      \ }
  let g:nvim_tree_icons = {
      \ 'default': '  ',
      \ 'symlink': '  ',
      \ 'git': {
      \   'unstaged': "[~]",
      \   'staged': "[+]",
      \   'unmerged': "[=]",
      \   'renamed': "[➜]",
      \   'untracked': "[✭]",
      \   'deleted': "[_]"
      \   },
      \ 'folder': {
      \   'default': "  📁",
      \   'open': "  📂"
      \   }
      \ }
  augroup CursorLine
    au!
    au BufEnter * if bufname('%') =~ 'NvimTree' | setlocal cursorline | exe 'NvimTreeRefresh' | endif
    au FileType NvimTree let t:explorer_winnr = bufwinnr('%')
    au TabLeave * exe 'NvimTreeClose'
    au BufWinEnter * call PreventBuffersInExplorer()
   augroup END

   function! PreventBuffersInExplorer()
    if bufname('%') !~ 'NvimTree'
           \ && exists('t:explorer_winnr') && bufwinnr('%') == t:explorer_winnr
           \ && &buftype == '' && winbufnr(2) != -1
       let bufnum = bufnr('%')
       close
      exe 'b ' . bufnum
      :NvimTreeOpen
     endif
   endfunction

  function! ToggleVExplorer()
      :NvimTreeToggle
  endfunction
else
  command! ExploreFind let @/=expand("%:t") |  exe 'Lexplore' | call feedkeys("n", "n")
  augroup netrw | au!
    autocmd FileType netrw let t:explorer_winnr = bufwinnr('%') | let g:NetrwIsOpen = 1
    autocmd FileType netrw nmap <buffer> <2-leftmouse><CR>
    autocmd VimLeavePre * if exists('t:explorer_winnr') && bufname(winbufnr(t:explorer_winnr)) =~# 'NetrwTreeListing' | execute t:explorer_winnr.'wincmd c' | endif 
  augroup END
  function! ToggleVExplorer()
    if exists('g:NetrwIsOpen') && g:NetrwIsOpen==1
        let i = bufnr("$")
        while (i >= -1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        exe 'ExploreFind'
    endif
  endfunction
  let g:netrw_banner = 0
  let g:netrw_liststyle = 3
  let g:netrw_preview = 1
  let g:netrw_browse_split = 4
  let g:netrw_alto = 0
  let g:netrw_winsize = 25
endif

" if substitute(system('uname'), '\n', '', '') != 'Linux'
"   let g:coc_global_extensions = g:coc_global_extensions + [
let g:coc_global_extensions = [ 'coc-eslint',
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-snippets',
      \ 'coc-docthis',
      \ 'coc-vimlsp',
      \ 'coc-angular',
      \ 'coc-omnisharp',
      \ 'coc-html',
      \ 'coc-go',
      \ 'coc-vetur']
" endif
