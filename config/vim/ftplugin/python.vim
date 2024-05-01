highlight BadWhitespace ctermbg=red guibg=red
let matchBadWhitespace = matchadd('BadWhitespace', '\\s\\+$')

highlight BadTabs ctermbg=red guibg=red
let matchBadTabs = matchadd('BadTabs', '^\\t+')

let b:undo_ftplugin = 'setlocal completeopt<'

if !filereadable('setup.cfg') && !filereadable('pyproject.toml')
  let g:ale_python_flake8_options = '--config ~/.config/flake8'
endif

let g:splitjoin_python_brackets_on_separate_lines = 1
