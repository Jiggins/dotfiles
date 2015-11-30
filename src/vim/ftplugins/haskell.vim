compiler ghc

if has('mac')
  let g:haddock_browser = "open"
  let g:haddock_browser_callformat = "%s %s"
  let g:haddock_docdir = $HOME . "/Library/Haskell/share/doc"
endif

nnoremap gz :.! pointfree --stdin<CR>
nnoremap <F1> :HdevtoolsType<CR>
nnoremap <silent> <F2> :HdevtoolsClear<CR>
nnoremap <silent> <F3> :HdevtoolsInfo<CR>
