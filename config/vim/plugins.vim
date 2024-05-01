scriptencoding utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source %
endif

call plug#begin('~/.vim/bundle')

" Aesthetics
Plug 'airblade/vim-gitgutter'                               " Show git diff in gutter
Plug 'edkolev/tmuxline.vim'                                 " Simple tmux statusline generator with support for powerline symbols and statusline / airline / lightline integration
Plug 'junegunn/goyo.vim',             { 'on': 'Goyo' }      " Distraction-free writing in Vim
Plug 'junegunn/limelight.vim',        { 'on': 'Limelight' } " :flashlight: All the world's indeed a stage and we are merely players
Plug 'vim-airline/vim-airline'                              " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'                       " A collection of themes for vim-airline
" Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'                                   " A Vim Automatic Window Resizing Plugin
Plug 'wellle/context.vim'                                   " Vim plugin that shows the context of the currently visible buffer contents

" Colourschemes
Plug 'altercation/vim-colors-solarized'    " precision colorscheme for the vim text editor http://ethanschoonover.com/solarized
Plug 'arcticicestudio/nord-vim'            " An arctic, north-bluish clean and elegant Vim theme. https://git.io/nord-vim
Plug 'KabbAmine/vCoolor.vim'               " Simple color selector/picker plugin for Vim.
Plug 'romainl/flattened'                   " Solarized, without the bullshit.
Plug 'widatama/vim-phoenix'                " Monochrome color schemes for Vim

" General
Plug 'AndrewRadev/splitjoin.vim'                " A vim plugin that simplifies the transition between multiline and single-line code
Plug 'Shougo/vimproc.vim', {'do' : 'make'}      " Interactive command execution in Vim.
Plug 'editorconfig/editorconfig-vim'            " EditorConfig plugin for Vim http://editorconfig.org
Plug 'farmergreg/vim-lastplace'                 " Intelligently reopen files at your last edit position in Vim.
Plug 'idanarye/vim-vebugger'                    " Yes, we do need another debugger plugin
Plug 'junegunn/vim-slash'                       " Enhancing in-buffer search experience
Plug 'michaeljsmith/vim-indent-object'          " Vim plugin that defines a new text object representing lines of code at the same indent level
Plug 'ojroques/vim-oscyank', {'branch': 'main'} " A Vim plugin to copy text through SSH with OSC52
Plug 'powerman/vim-plugin-AnsiEsc'              " ansi escape sequences concealed, but highlighted as specified (conceal)
Plug 'puremourning/vimspector'                  " A multi-language debugging system for Vim
Plug 'tpope/vim-apathy'                         " apathy.vim: Set the 'path' option for miscellaneous file types
Plug 'tpope/vim-endwise'                        " endwise.vim: wisely add end in ruby, endfunction/endif/more in vim script, etc http://www.vim.org/scripts/script.php?script_id=2386
Plug 'tpope/vim-fugitive'                       " a Git wrapper so awesome, it should be illegal http://www.vim.org/scripts/script.php?script_id=2975
Plug 'tpope/vim-obsession'                      " obsession.vim: continuously updated session files
Plug 'tpope/vim-rhubarb'                        " GitHub extension for fugitive.vim
Plug 'tpope/vim-sleuth'                         " sleuth.vim: Heuristically set buffer options
Plug 'vim-test/vim-test'                        " Run your tests at the speed of thought

" Text objects
Plug 'Julian/vim-textobj-variable-segment', { 'branch': 'main' } " iv/av | A text object to turn foo_bar_baz into foo_baz *and* quuxSpamEggs into quuxEggs *and* shine your shoes
Plug 'adolenc/vim-textobj-toplevel'                              " it/at | Text object for selecting top-level blocks in any programming language
Plug 'bps/vim-textobj-python', { 'for': 'python' }               " | Text objects for Python.
Plug 'glts/vim-textobj-comment'                                  " ic/ac | Vim text objects for comments
Plug 'idbrii/textobj-word-column.vim'                            " iq/aq | Adds text-objects for word-based columns in Vim.
Plug 'kana/vim-textobj-entire'                                   " ie/ae | Text objects for entire buffer
Plug 'kana/vim-textobj-function'                                 " if/af | Text objects for functions
Plug 'kana/vim-textobj-indent'                                   " ii/ai | Text objects for indented blocks of lines
Plug 'kana/vim-textobj-line'                                     " il/al | Text objects for the current line
Plug 'kana/vim-textobj-syntax'                                   " iy/ay | Text objects for syntax highlighted items
Plug 'kana/vim-textobj-user'                                     " | Create your own text objects
Plug 'nelstrom/vim-textobj-rubyblock', { 'for': 'ruby' }         " | Ruby text objects
Plug 'vimtaku/vim-textobj-keyvalue'                              " iv/ik | Provide text objects to select a string that general key and value of map.

" FZF - 🌸 A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Languages
Plug 'Absolight/vim-bind',        { 'for': 'bindzone' }  " DNS Bind zone & named plugin
Plug 'Glench/Vim-Jinja2-Syntax',  { 'for': 'jinja' }     " An 'up-to-date' jinja2 syntax file.
Plug 'Joorem/vim-haproxy',        { 'for': 'haproxy' }   " HAProxy syntax file
Plug 'adimit/prolog.vim',         { 'for': 'prolog' }
Plug 'aliou/bats.vim',            { 'for': 'bats' }      " Syntax files for Bats (Bash Automated Testing System).
Plug 'cespare/vim-toml',          { 'for': 'toml' }      " Vim syntax for TOML
Plug 'chikamichi/mediawiki.vim',  { 'for': 'mediawiki' } " Syntax highlighting for MediaWiki-based projects, such as Wikipedia.
Plug 'chr4/nginx.vim',            { 'for': 'nginx' }     " Improved nginx vim plugin (incl. syntax highlighting)
Plug 'chrisbra/csv.vim',          { 'for': 'csv' }       " A Filetype plugin for csv files
Plug 'chrisbra/unicode.vim'
Plug 'dag/vim-fish',              { 'for': 'fish' }
Plug 'derekwyatt/vim-scala',      { 'for': 'scala' }
Plug 'idbrii/vim-tagimposter'                            " Forge tag jumps so tag alternatives can populate the tagstack.
Plug 'kana/vim-gf-diff'                                  " Vim plugin: Go to the changed block under the cursor from diff output
Plug 'kana/vim-gf-user'                                  " Vim plugin: A framework to open a file by context
Plug 'mityu/vim-applescript'
Plug 'momota/cisco.vim',          { 'for': 'cisco' }     " Vim syntax for cisco configuration files.
Plug 'momota/junos.vim',          { 'for': 'junos' }     " Vim syntax for Junos configuration files
Plug 'rhysd/vim-crystal',         { 'for': 'crystal' }   " Vim filetype and tools support for Crystal language. http://crystal-lang.org/
Plug 'tangledhelix/vim-rdist',    { 'for': 'rdist' }     " Vim syntax highlighting for Rdist
Plug 'tmhedberg/matchit'                                 " extended % matching for HTML, LaTeX, and many other languages
Plug 'tpope/vim-scriptease',      { 'for': 'vim' }       " scriptease.vim: A Vim plugin for Vim plugins

"" Languages - English
Plug 'amperser/proselint'                  " Proselint plugin for Vim
Plug 'beloglazov/vim-online-thesaurus'     " A Vim plugin for looking up words in an online thesaurus

"" Languages - Haskell
Plug 'hspec/hspec.vim',                   { 'for': 'haskell' } " Vim syntax file for Hspec
Plug 'raichoo/haskell-vim',               { 'for': 'haskell' } " Custom Haskell Vimscripts
Plug 'Twinside/vim-hoogle',               { 'for': 'haskell' } " Vim plugin used to query hoogle, the haskell search engine
Plug 'Twinside/vim-syntax-haskell-cabal', { 'for': 'haskell' } " Syntax file for Haskell's cabal syntax file

"" Languages - Python
Plug 'davidhalter/jedi-vim',      { 'for': 'python' } " Jedi-vim is a Vim binding to the awesome Python autocompletion library `jedi`.
Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' } " Vim plugin for working with python virtualenvs
Plug 'lambdalisue/vim-pyenv',     { 'for': 'python' } " Activate the versions and the virtualenvs of pyenv within a live VIM session

"" Languages - Ruby
Plug 'danchoi/ri.vim',                 { 'for': 'ruby' } " browse ri documentation from Vim http://github.com/danchoi/ri.vim

"" Languages - Terraform
Plug 'hashivim/vim-terraform',                { 'for': 'terraform' } " Basic vim/terraform integration http://hashivim.github.io/vim-terraform

"" Languages - Web Dev
Plug 'cakebaker/scss-syntax.vim',  { 'for': 'css' }        " Vim syntax file for scss (Sassy CSS)
Plug 'gregsexton/MatchTag',        { 'for': 'html' }       " Vim's MatchParen for HTML tags http://www.vim.org/scripts/script.php?script_id=3818
Plug 'mattn/emmet-vim',            { 'for': 'html' }       " emmet for vim: http://emmet.io/ http://mattn.github.io/emmet-vim

" Navigation
Plug 'majutsushi/tagbar',           { 'on': 'Tagbar' }   " Vim plugin that displays tags in a window, ordered by scope http://majutsushi.github.com/tagbar
Plug 'mbbill/undotree'                                   " Visualise undo tree
Plug 'scrooloose/nerdtree',         { 'on': 'NERDTree' } " A tree explorer plugin for vim.
Plug 'vim-utils/vim-vertical-move'                       " Move to bottom of text easily
Plug 'wesQ3/vim-windowswap'                              " Swap two panes in Vim
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTree' }

" Text Editing
Plug 'ervandew/supertab'                   " Tab completion with Tab
Plug 'inkarkat/argtextobj.vim'             " Text-object like motion for arguments http://www.vim.org/scripts/script.php?script_id=2699
Plug 'junegunn/vim-emoji'                  " Vim support for Emoji
Plug 'terryma/vim-multiple-cursors'        " Create multiple cursors in Vim
Plug 'tomtom/tcomment_vim'                 " Comment a line with gcc
Plug 'tpope/vim-characterize'              " Print the unicode value of the character under the cursor - ga
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'               " use CTRL-A/CTRL-X to increment dates, times, and more http://www.vim.org/scripts/script.php?script_id=2120
Plug 'tpope/vim-surround'                  " Surround text with a character or brackets
Plug 'vim-utils/vim-space'                 " Select in and around whitespace
Plug 'wellle/targets.vim'                  " Vim plugin that provides additional text objects

" tmux Integration
Plug 'benmills/vimux'                      " Open a tmux session from Vim
Plug 'christoomey/vim-tmux-navigator'      " Move between Vim and tmux panes with one short cut
Plug 'jpalardy/vim-slime'                  " Copy text to repl in tmux
Plug 'tmux-plugins/vim-tmux-focus-events'  " Fix for FocusGained and FocusLost autocommand events in tmux.
Plug 'tpope/vim-tbone'                     " tmux basics http://www.vim.org/scripts/script.php?script_id=4488

if v:version >= 740
  Plug 'Quramy/tsuquyomi',             { 'for': 'typescript' } " A Vim plugin for TypeScript
  Plug 'vim-pandoc/vim-pandoc',                                " pandoc integration and utilities for vim
  Plug 'vim-pandoc/vim-pandoc-syntax',                         " pandoc markdown syntax, to be installed alongside vim-pandoc
endif

" Plugins requiring async support
if v:version >= 800
  Plug 'metakirby5/codi.vim'             " The interactive scratchpad for hackers.
  Plug 'w0rp/ale'                        " Asynchronous Lint Engine
endif

if has('mac')
  Plug 'vim-scripts/MailApp'               " This plugin allows Mac OS X users to send e-mails from Vim using Mail.app.
endif

if !has('clipboard')
  Plug 'kana/vim-fakeclip'                 " Vim plugin: Provide pseudo 'clipboard' registers
endif

" After
Plug 'godlygeek/tabular', { 'on': 'Tabularize' } " Align text; like these comments
Plug 'ryanoasis/vim-devicons'              " Adds font icons (glyphs ★♨☢) to programming languages, libraries,
                                           " and web developer filetypes for: NERDTree, powerline, vim-airline,
                                           " ctrlp, unite, lightline.vim, vim-startify, vimfiler, and flagship

" Load any additional plugins from local.vim
for plugin in g:AdditionalPlugins
  Plug plugin
endfor

call plug#end()
