" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'

" determine whether inactive windows should have the left section collapsed to only the filename of that buffer.
let g:airline_inactive_collapse=1

let g:airline#extensions#wordcount#filetypes = ['asciidoc', 'help', 'mail', 'markdown', 'pandoc', 'rmd', 'nroff', 'org', 'rst', 'plaintex', 'tex', 'text']

let g:airline#extensions#default#layout = [
      \ [ 'a', 'c', 'b' ],
      \ [ 'x', 'y', 'z', 'error', 'warning' ]
      \ ]
