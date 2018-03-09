" Linux specific configs

" Open url under cursor with gx
let g:netrw_browsex_viewer = 'xdg-open'

let g:haddock_docdir = ''

" Override Mail command (~/.vim/vim-commands)
command! Mail execute "w !pandoc -t html --template ~/.pandoc/template.html --css ~/.pandoc/template.css -o /tmp/email.html && xdg-open /tmp/email.html"
