" MacOS specific configs

" Open url under cursor with gx
let g:netrw_browsex_viewer = 'open'

let g:haddock_docdir = $HOME . '/Library/Haskell/share/doc'

" Override Mail command (~/.vim/vim-commands)
command! Mail execute "w !pandoc -t html --template ~/.pandoc/template.html --css ~/.pandoc/template.css -o /tmp/email.html && open -g -a Safari /tmp/email.html"
