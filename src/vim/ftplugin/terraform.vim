inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-y> <Plug>(asyncomplete_force_refresh)

" imap <c-u> <Plug>(ale_complete)

if executable('terraform-lsp')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'terraform-lsp',
        \ 'cmd': {server_info->['terraform-lsp']},
        \ 'whitelist': ['terraform'],
        \ })
endif
