function! BashLangServProjRoot(buffer)
  let l:git_path = ale#path#FindNearestDirectory(a:buffer, '.git')
  let l:curr_dir = fnamemodify(bufname(a:buffer), ':h')
  return !empty(l:git_path) ? fnamemodify(l:git_path, ':h:h') : l:curr_dir
endfunction

call ale#linter#Define('sh', {
\   'name': 'bashls',
\   'lsp': 'stdio',
\   'executable': function('ale_linters#sh#language_server#GetExecutable'),
\   'command': function('ale_linters#sh#language_server#GetCommand'),
\   'project_root': function('BashLangServProjRoot'),
\})
