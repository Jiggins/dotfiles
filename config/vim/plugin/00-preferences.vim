let g:tmp_dir = $VIMHOME . '/tmp/'
let g:undo_dir = $VIMHOME . '/undo/'

for s:dir in [g:tmp_dir, g:undo_dir]
  if ! isdirectory(s:dir)
    let s:stdout = system('mkdir -p ' . s:dir)
  endif
endfor

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Colour Scheme
if filereadable(expand($VIMHOME . '/colors/maui.vim'))
  colorscheme maui
endif

" Reload session
set viminfo='10,<100,:20,%
set viminfofile=$VIMHOME/.viminfo

" Text editing
set autoindent
set backspace=indent,eol,start
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set iskeyword+=-               " Sets '-' as a non word boundary - useful for Bash
set listchars=tab:▒░,trail:▓   " Highlights tabs and trailing whitespace when list is set
set nolist
set spelllang=en_gb
set timeoutlen=1000 ttimeoutlen=0 " 1 ms delay after hitting escape (default: too much)

" c	Auto-wrap comments using textwidth, inserting the current comment
" 	leader automatically.
" r	Automatically insert the current comment leader after hitting
" 	<Enter> in Insert mode.
" q	Allow formatting of comments with "gq".
" 	Note that formatting will not change blank lines or lines containing
" 	only the comment leader.  A new paragraph starts after such a line,
" 	or when the comment leader changes.
" j	Where it makes sense, remove a comment leader when joining lines.  For
" 	example, joining:
set formatoptions=crqj
set textwidth=120

set completeopt=menu,menuone,noselect,noinsert

if v:version >= 901
  set completeopt+=fuzzy
endif

" Undofile
if exists('+undofile')
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backup files, uses ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  exe 'set undodir=' . g:undo_dir
  set undofile
endif

" Swapfile
" This will warn you if you try to open the same file in two vim instances it
" will also let you recover if vim crashes or an ssh session ends.
set swapfile
exe 'set directory=' . g:tmp_dir

" Tabs
set tabstop=2 shiftwidth=2 expandtab
set smarttab
set shiftround

" Line numbers
set number
set cursorline

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
set hlsearch

set autoread

" Bottom bar
set laststatus=2
set ruler
set showcmd
set wildmenu

" Open vsplits on the right
set splitright

" Numbers
" Allows for Ctrl+a to increment letters and hex
" Ctrl+x decrements
set nrformats-=alpha,hex
" File handling
set nobackup
set fileformats=unix,dos,mac

" Shell
if $SHELL =~ 'bin/fish'
  set shell=/bin/sh
endif

" Syntax aliases
autocmd BufRead,BufNewFile .simplecov set syntax=ruby

" Load local .vimrc
set exrc

" Agrep
let agrep_win_sp_mod = 'botright vert'

" EditorConfig
" Disable EditorConfig for tpope's fugitive.
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Devicons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

" Fugitive.vim
set tags^=./.git/tags

" LimeLight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" NERDTree
" Exit vim if NERDTree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" SuperTab
let g:SuperTabDefaultCompletionType = 'context'

" Tagbar
let g:tagbar_sort = 0

" Tmuxline
" Run `:TmuxlineSnapshot! ~/.tmux/powerline.tmux`
" after updating g:tmuxline_preset
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : ['#I #W'],
      \'cwin' : ['#I #W #F'],
      \'x'    : ['#(~/bin/active-task.sh --tmux)', '#(~/bin/loadavg-tmux)'],
      \'y'    : ['#I:#P', '%F', '%R'],
      \'z'    : '#h',
      \'options' : {'status-justify' : 'left' }}

" vim-Haskell
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 2
let g:haskell_indent_in = 2
let g:cabal_indent_section = 2

" vim-slime
let g:slime_target = 'tmux'
let g:slime_default_config = {'socket_name': 'default', 'target_pane': ':1.1'}

" vim-slash
" Places the current match at the center of the window.
noremap <plug>(slash-after) zz
