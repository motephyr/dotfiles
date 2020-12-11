if bufname('%') !~ 'scp'

  autocmd FileType coc-explorer let t:explorer_winnr = bufwinnr('%')
  autocmd VimLeavePre * if exists('t:explorer_winnr') && bufname(winbufnr(t:explorer_winnr)) =~# 'coc-explorer' | execute t:explorer_winnr.'wincmd c' | endif
  autocmd BufWinEnter * call PreventBuffersInExplorer()

  function! PreventBuffersInExplorer()
    if bufname('#') =~ 'coc-explorer' && bufname('%') !~ 'coc-explorer'
          \ && exists('t:explorer_winnr') && bufwinnr('%') == t:explorer_winnr
          \ && &buftype == '' && winbufnr(2) != -1
      let bufnum = bufnr('%')
      close
      exe 'b ' . bufnum
      :CocCommand explorer
    endif
  endfunction
else
  autocmd FileType netrw let t:explorer_winnr = bufwinnr('%') | let g:NetrwIsOpen = 1
  autocmd FileType netrw nmap <buffer> <2-leftmouse> <CR>
  autocmd VimLeavePre * if exists('t:explorer_winnr') && bufname(winbufnr(t:explorer_winnr)) =~# 'NetrwTreeListing' | execute t:explorer_winnr.'wincmd c' | endif 

  autocmd BufWinEnter * call PreventBuffersInExplorer()

  let g:scp_path = bufname('%')
  function! PreventBuffersInExplorer()
    if bufname('%') !~ 'NetrwTreeListing'
          \ && exists('t:explorer_winnr') && bufwinnr('%') == t:explorer_winnr
          \ && &buftype == '' && winbufnr(2) != -1
      let bufnum = bufnr('%')
      close
      exe 'b ' . bufnum
      exe 'Nread ' . g:scp_path
    endif
  endfunction


  function! ToggleVExplorer()
    if exists('g:NetrwIsOpen')
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        exe 'lefta vsp'
        exe 'lefta vsp'
        exe 'Nread ' . g:scp_path
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
let g:coc_global_extensions = ['coc-explorer', 'coc-eslint',
      \ 'coc-tsserver',
      \ 'coc-json',
      \ 'coc-yaml',
      \ 'coc-snippets',
      \ 'coc-vetur',
      \ 'coc-docthis',
      \ 'coc-vimlsp',
      \ 'coc-angular',
      \ 'coc-omnisharp',
      \ 'coc-html']
" endif
