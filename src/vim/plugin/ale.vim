" ALE - Asynchronous Linting Engine
"
" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax
" checking and semantic errors) in NeoVim 0.2.0+ and Vim 8 while you edit your
" text files, and acts as a Vim Language Server Protocol client.
"
" https://github.com/dense-analysis/ale#usage-completion

let g:ale_linters = {
\   'haskell': ['stack-build', 'stack-ghc-mod'],
\   'pandoc': ['markdownlint', 'proselint'],
\   'python': ['pyls'],
\   'typescript': ['eslint', 'tsserver']
\}

let g:ale_fixers = {
\   'html': ['prettier'],
\   'javascript': ['eslint'],
\   'json': ['jq'],
\   'python': ['autopep8', 'isort', 'add_blank_lines_for_python_control_statements'],
\   'ruby': ['rubocop'],
\   'scss': ['prettier'],
\   'terraform': ['terraform', 'terraform-lsp'],
\   'typescript': ['eslint'],
\   'vue': ['eslint'],
\   'yaml': ['prettier'],
\}

" cache failing executable checks for linters. AKA don't keep checking for
" linters that are not installed
let g:ale_cache_executable_check_failures=1

" Prefix all commands with nice.
let g:ale_command_wrapper = 'nice -n5'

" Don't lint whilst in insert mode
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'normal'

" Enable ale completion
let g:ale_completion_enabled = 1
