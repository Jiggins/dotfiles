autocmd Bufenter *.hs compiler ghc
autocmd BufEnter *.hs set formatprg=pointfree\ --stdin
autocmd BufLeave *.hs set formatprg=

if has('mac')
  let g:haddock_browser = "open"
  let g:haddock_browser_callformat = "%s %s"
  let g:haddock_docdir = $HOME . "/Library/Haskell/share/doc"
endif

au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>
