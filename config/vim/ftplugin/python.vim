function s:hasLinterConfig(linter)
  let l:configFiles = ['setup.cfg', 'pyproject.toml']

  for config in l:configFiles
    if filereadable(config) && match(readfile(expand(config)), a:linter) >= 0
      return v:true
    endif
  endfor

  return v:false
endfunction

function s:enablePythonLinters()
  let l:linters = ['black', 'flake8', 'mypy', 'pylint', 'pyright', 'ruff']

  return filter(l:linters, 's:hasLinterConfig(v:val)' )
endfunction

if !filereadable('setup.cfg') && !filereadable('pyproject.toml')
  let g:ale_python_flake8_options = '--config ~/.config/flake8'
else
  let g:ale_linters.python = s:enablePythonLinters()
endif

highlight BadWhitespace ctermbg=red guibg=red
let matchBadWhitespace = matchadd('BadWhitespace', '\\s\\+$')

highlight BadTabs ctermbg=red guibg=red
let matchBadTabs = matchadd('BadTabs', '^\\t+')

let b:undo_ftplugin = 'setlocal completeopt<'

let g:splitjoin_python_brackets_on_separate_lines = 1
