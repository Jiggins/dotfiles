highlight BadWhitespace ctermbg=red guibg=red
let matchBadWhitespace = matchadd('BadWhitespace', '\\s\\+$')

highlight BadTabs ctermbg=red guibg=red
let matchBadTabs = matchadd('BadTabs', '^\\t+')

let b:undo_ftplugin = 'setlocal completeopt<'

if !filereadable('setup.cfg')
    let g:ale_python_flake8_options = '--config ~/.config/flake8'
endif
