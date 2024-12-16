setlocal tabstop=4
setlocal shiftwidth=4

setlocal nowrap
setlocal conceallevel=0

setlocal textwidth=120
setlocal formatoptions=trqjn

let g:pandoc#formatting#textwidth = 120
let g:pandoc#formatting#equalprg = 'pandoc -t markdown+pipe_tables'
let g:pandoc#formatting#extra_equalprg = '--markdown-headings=atx --reference-links --columns=120'

let g:pandoc#syntax#codeblocks#embeds#langs = ['bash=sh', 'haskell', 'java', 'javascript', 'json', 'ruby', 'python', 'sh', 'sql', 'typescript']
let g:pandoc#syntax#conceal#blacklist = ['atx', 'list', 'quotes']
let g:pandoc#syntax#conceal#urls = 1

let g:neocomplete#release_cache_time=30

nnoremap <buffer> ]] :call CustomJump('/^#')<cr>
nnoremap <buffer> [[ :call CustomJump('?^#')<cr>

map K :OnlineThesaurusCurrentWord<CR>

let g:ale_linters.pandoc = ['cspell']

let b:undo_ftplugin = 'setlocal formatoptions<|setlocal tabstop<|setlocal shiftwidth<|setlocal textwidth<'
