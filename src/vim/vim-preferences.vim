if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Text editing
set autoindent
set backspace=indent,eol,start
set complete-=i
set encoding=utf-8
set fileencoding=utf-8
set iskeyword-=_               " Sets '_' as a word boundary - useful for Ruby
set listchars=tab:▒░,trail:▓   " Highlights tabs and trailing whitespace when list is set
set nolist
set spelllang=en_gb

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
" Allows for Ctrl+a to increment letters and hex
" Ctrl+x decrements
set nrformats-=alpha,hex

" File handling
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" Shell
if $SHELL =~ 'bin/fish'
  set shell=/bin/sh
endif

" Colour Scheme
if filereadable(expand('~/.vim/colors/Monokai.vim'))
  colorscheme Monokai
endif

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'

" vim-Haskell
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 2
let g:haskell_indent_in = 2
let g:cabal_indent_section = 2

" vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":1.1"}

" Syntastic
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
