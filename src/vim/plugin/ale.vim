" ALE - Asynchronous Linting Engine
"
" ALE (Asynchronous Lint Engine) is a plugin providing linting (syntax
" checking and semantic errors) in NeoVim 0.2.0+ and Vim 8 while you edit your
" text files, and acts as a Vim Language Server Protocol client.
"
" https://github.com/dense-analysis/ale#usage-completion

let g:ale_linters = {
\   'pandoc': ['markdownlint', 'proselint'],
\   'typescript': ['eslint', 'tsserver']
\}

let g:ale_fixers = {
\   'haskell': ['hie'],
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

" Enable balloon support
let g:ale_set_balloons= 1
set balloonevalterm
set balloonexpr=ale#balloon#Expr()

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

" Enable auto imports
let g:ale_completion_autoimport = 1

" Replace Vim's 'Go to Tag' feature with ALE's go to fucntion,
" also have it add to the tag stack so we can easily come back
" https://vi.stackexchange.com/a/38866/5952
execute "set <C-M-]>=\<Esc>\<C-]>"
nmap <c-]> :TagJump <bar> ALEGoToDefinition<cr>
nmap <c-m-]> :TagJump <bar> ALEGoToDefinition -vsplit<cr>

" Look up documentation and linting errors in a floating window
let g:ale_detail_to_floating_preview = 1
let g:ale_hover_to_floating_preview = 1

" Disable inline errors
let g:ale_virtualtext_cursor = 0

nnoremap <F6> :ALEHover<cr>
