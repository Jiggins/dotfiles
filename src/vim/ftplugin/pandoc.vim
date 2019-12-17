set tabstop=4
set shiftwidth=4

set nowrap
set conceallevel=0

let g:pandoc#formatting#textwidth = 80
let g:pandoc#formatting#equalprg = 'pandoc -t markdown'
let g:pandoc#formatting#extra_equalprg = '--atx-headers --reference-links --columns=80'

let g:pandoc#syntax#codeblocks#embeds#langs = ['bash=sh', 'haskell', 'ruby', 'python', 'sh']
let g:pandoc#syntax#conceal#blacklist = ['atx', 'list', 'quotes']
let g:pandoc#syntax#conceal#urls = 1

let g:neocomplete#release_cache_time=30

nnoremap <buffer> ]] :call CustomJump('/^#')<cr>
nnoremap <buffer> [[ :call CustomJump('?^#')<cr>

map K :OnlineThesaurusCurrentWord<CR>
