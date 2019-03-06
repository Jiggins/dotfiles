if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Colour Scheme
if filereadable(expand('~/.vim/colors/maui.vim'))
  colorscheme maui
endif

" Reload session
set viminfo='10,\"100,:20,%,n~/.viminfo

" Text editing
set autoindent
set backspace=indent,eol,start
set completeopt=menu,menuone,preview,noselect,noinsert
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set iskeyword+=-               " Sets '-' as a non word boundary - useful for Bash
set listchars=tab:▒░,trail:▓   " Highlights tabs and trailing whitespace when list is set
set nolist
set spelllang=en_gb
set timeoutlen=1000 ttimeoutlen=0 " 1 ms delay after hitting escape (default: too much)

" Undofile
if exists('+undofile')
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backup files, uses ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if ! isdirectory($HOME . '/.vim/undo')
    silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif

  set undodir=~/.vim/undo//
  set undofile
endif

" Swapfile
" This will warn you if you try to open the same file in two vim instances it
" will also let you recover if vim crashes or an ssh session ends.
set swapfile
if ! isdirectory($HOME . '/.vim/tmp')
  silent !mkdir -p ~/.vim/tmp > /dev/null 2>&1
endif
set directory=~/.vim/tmp/

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

" Load local .vimrc
set exrc

" Agrep
let agrep_win_sp_mod = 'botright vert'

" ALE - Asynchronous Linting Engine
let g:ale_linters = {
\   'haskell': ['stack-build', 'stack-ghc-mod'],
\   'pandoc': ['proselint'],
\}

let g:ale_fixers = {
\   'python': ['autopep8', 'add_blank_lines_for_python_control_statements'],
\   'ruby': ['rubocop']
\}

" cache failing executable checks for linters. AKA don't keep checking for
" linters that are not installed
let g:ale_cache_executable_check_failures=1

" Prefix all commands with nice.
let g:ale_command_wrapper = 'nice -n5'

" Don't lint whilst in insert mode
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'normal'

" Enable ale completion
let g:ale_completion_enabled = 1

" EditorConfig
" Disable EditorConfig for tpope's fugitive.
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Devicons
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 0

" LimeLight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" NERDTree
" Exit vim if NERDTree is the only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Pandoc
let g:pandoc#syntax#codeblocks#embeds#langs = ['haskell','python','ruby']
let g:pandoc#syntax#conceal#blacklist = ['atx', 'list', 'quotes']
let g:pandoc#syntax#conceal#urls = 1
let g:pandoc#modules#disabled = [ 'spell' ]

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
      \'x'    : ['#(~/bin/active-task.sh)', '#(~/bin/loadavg-tmux)'],
      \'y'    : ['#I:#P', '%F', '%R'],
      \'z'    : '#h',
      \'options' : {'status-justify' : 'left' }}

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
let g:slime_target = 'tmux'
let g:slime_default_config = {'socket_name': 'default', 'target_pane': ':1.1'}
