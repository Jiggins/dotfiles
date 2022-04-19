let g:tsuquyomi_shortest_import_path = 1

" A way to open a target file when navigating with
" |:TsuquyomiDefinition| or |:TsuquyomiTypeDefinition|.
" * 0: |:edit|
" * 1: |:split|
" * 2: |:vsplit|
" * 3: |:tabedit|
let g:tsuquyomi_definition_split = 2

" Whether to show details of complete menu when |tsuquyomi#complete|.
" This option makes sense when 'completeopt' includes "menu".
" NOTE: If it's set, completions get slow.
let g:tsuquyomi_completion_preview = 1

" Whether to show details of complete menu when |tsuquyomi#complete|.
" This option makes sense when 'completeopt' includes "menu".
" NOTE: If it's set, completions get slow.
let g:tsuquyomi_completion_detail = 1

" If set, Tsuquyomi generates import block using a semicolon at
" the end when |:TsuquyomiImport|.
let g:tsuquyomi_semicolon_import = 0

" Import the symbol under the cursor
nmap <buffer> <F6> :TsuImport<CR>

" Returns information about the symbol under the cursor. This
" function is similar to |tsuquyomi#balloonexpr|, but
" works not only in GVim but also in terminal Vim.
nmap <buffer> <Leader>t :<C-u>echo tsuquyomi#hint()<CR>

" Disable ALE completion in favour of Tsuquyomi completion
let g:ale_completion_enabled = 0

" Tab completion is omnicomple
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

let b:undo_ftplugin = 'setlocal completeopt<'
