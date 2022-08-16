highlight BadWhitespace ctermbg=red guibg=red
let matchBadWhitespace = matchadd("BadWhitespace", "\\s\\+$")

highlight BadTabs ctermbg=red guibg=red
let matchBadTabs = matchadd("BadTabs", "^\\t+")

let b:undo_ftplugin = 'setlocal completeopt<'

" TODO: enable these options only if not inside a python project
let g:ale_python_flake8_options = '--config ~/.config/pylint'
