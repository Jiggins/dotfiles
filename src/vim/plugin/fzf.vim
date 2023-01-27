" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Open FZF in a tmux popup window instead of within Vim
" See `man fzf-tmux` for available options
if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endif

" Show all branches in a graph with :Commits
let g:fzf_commits_log_options = '--decorate --all --graph --oneline --color=always'

nmap <leader>a :Ag<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>c :Commits<cr>
nmap <leader>f :Files<cr>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
