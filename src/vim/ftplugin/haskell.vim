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

nnoremap <buffer> ]] :call CustomJump('/::')<cr>^
nnoremap <buffer> [[ :call CustomJump('?::')<cr>^

" Tabular patterns
if exists(':AddTabularPattern')
  AddTabularPattern! colon                  /^[^:]*\zs:/
  AddTabularPattern! haskell_bindings       /^[^=]*\zs=\ze[^[:punct:]]/
  AddTabularPattern! haskell_comments       /--.*/l2
  AddTabularPattern! haskell_do_arrows      / \(<-\|←\) /l0r0
  AddTabularPattern! haskell_imports        /^[^(]*\zs(.*\|\<as\>.*/
  AddTabularPattern! haskell_pattern_arrows / \(->\|→\) /l0r0
  AddTabularPattern! haskell_types          / \(::\|∷\) /l0r0
endif

