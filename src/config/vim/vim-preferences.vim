if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Text editing
set encoding=utf-8
set fileencoding=utf-8
set autoindent
set backspace=indent,eol,start
set complete-=i
set listchars=tab:▒░,trail:▓
set list!

" Tabs
set tabstop=2 shiftwidth=2 expandtab
set smarttab
set shiftround

" Line numbers
set number

" Word wrap
set nowrap

" Show matching bracket
set showmatch

" Show what mode vim is in
set showmode

" Mouse works in insert and visual mode
set mouse=iv

" Searching
set smarttab
set incsearch
set ic " case insensitive search
set hlsearch

set autoread

" Bottom bar
set laststatus=2
set ruler
set showcmd
set wildmenu

" Numbers
" Allows for Ctrl+a to inrement letters and hex
" Ctrl+x decrements
set nrformats-=alpha,hex

" File handling
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" Colour Scheme
if filereadable(expand('~/.config/vim/bundle/vim-colorschemes/colors/Monokai.vim'))
  colorscheme Monokai
endif

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'

" vim-hakell
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 2
let g:haskell_indent_in = 2
let g:cabal_indent_section = 2
