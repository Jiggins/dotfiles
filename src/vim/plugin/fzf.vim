nmap <leader>a :Ag<cr>
nmap <leader>b :Buffers<cr>
nmap <leader>c :Commits<cr>
nmap <leader>f :Files<cr>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
