highlight OverLength ctermbg=red ctermfg=white guibg=#FF3333 guifg=#EEEEEE
let matchOverLength = matchadd("OverLength", "\\%121v.*")

highlight BadWhitespace ctermbg=red guibg=red
let matchBadWhitespace = matchadd("BadWhitespace", "\\s\\+$")

highlight BadTabs ctermbg=red guibg=red
let matchBadTabs = matchadd("BadTabs", "^\\t+")

let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_python_checkers = ['python', 'pep8']
