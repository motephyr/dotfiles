if bufname('%') !~ 'scp'
  augroup coc_explorer | au!
    autocmd FileType coc-explorer let t:explorer_winnr = bufwinnr('%')
    autocmd BufWinEnter * call PreventBuffersInExplorer()
  augroup END
  function! PreventBuffersInExplorer()
    if bufname('#') =~ 'coc-explorer' && bufname('%') !~ 'coc-explorer'
          \ && exists('t:explorer_winnr') && bufwinnr('%') == t:explorer_winnr
          \ && &buftype == '' && winbufnr(2) != -1
      let bufnum = bufnr('%')
      close
      exe 'b ' . bufnum
      :CocCommand explorer --no-focus
    endif
  endfunction

  function! ToggleVExplorer()
      :CocCommand explorer --no-focus
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
