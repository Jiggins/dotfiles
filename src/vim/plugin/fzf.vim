nmap <leader>a :Ag<cr>
nmap <leader>f :Files<cr>
nmap <leader>c :Commits<cr>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
