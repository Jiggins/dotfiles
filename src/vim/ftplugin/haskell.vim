compiler ghc

setlocal suffixesadd=hs,lhs,hsc

setlocal keywordprg=hoogle

if has('mac')
  let g:haddock_browser = "open"
  let g:haddock_browser_callformat = "%s %s"
  let g:haddock_docdir = $HOME . "/Library/Haskell/share/doc"
endif

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Key bindings
" Vimux
nnoremap <Leader>vc :VimuxRunCommand("ghci -i " . expand("%"))<CR>

nnoremap gz :.! pointfree --stdin<CR>
nnoremap <F1> :HdevtoolsType<CR>
nnoremap <silent> <F2> :HdevtoolsClear<CR>
nnoremap <silent> <F3> :HdevtoolsInfo<CR>
