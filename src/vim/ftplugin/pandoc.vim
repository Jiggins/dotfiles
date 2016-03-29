set tabstop=4
set shiftwidth=4

set nowrap
set conceallevel=0

let g:pandoc#formatting#textwidth = 80
let g:pandoc#formatting#equalprg = "pandoc -t markdown"
let g:pandoc#formatting#extra_equalprg = "--atx-headers --reference-links --columns=80"

let g:neocomplete#release_cache_time=30

nnoremap <buffer> ]] :call CustomJump('/^#')<cr>
nnoremap <buffer> [[ :call CustomJump('?^#')<cr>

map K :OnlineThesaurusCurrentWord<CR>
