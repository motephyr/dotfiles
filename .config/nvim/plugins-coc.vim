let g:coc_global_extensions = ['coc-explorer',
      \ 'coc-eslint',
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
