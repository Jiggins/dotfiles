scriptencoding utf-8

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" Aesthetics
Plug 'airblade/vim-gitgutter'              " Show git diff in gutter
Plug 'junegunn/goyo.vim'                   " Distraction-free writing in Vim
Plug 'junegunn/limelight.vim'              " :flashlight: All the world's indeed a stage and we are merely players
Plug 'kien/rainbow_parentheses.vim'        " Better Rainbow Parentheses
Plug 'vim-airline/vim-airline'             " lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline-themes'      " A collection of themes for vim-airline
Plug 'edkolev/tmuxline.vim'                " Simple tmux statusline generator with support for powerline symbols and statusline / airline / lightline integration

" Colourschemes
Plug 'altercation/vim-colors-solarized'    " precision colorscheme for the vim text editor http://ethanschoonover.com/solarized
Plug 'widatama/vim-phoenix'                " Monochrome color schemes for Vim
Plug 'romainl/flattened'                   " Solarized, without the bullshit.

" General
Plug 'AndrewRadev/splitjoin.vim'           " A vim plugin that simplifies the transition between multiline and single-line code
Plug 'ctrlpvim/ctrlp.vim'                  " Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder. http://ctrlpvim.github.com/ctrlp.vim
Plug 'editorconfig/editorconfig-vim'       " EditorConfig plugin for Vim http://editorconfig.org
Plug 'farmergreg/vim-lastplace'            " Intelligently reopen files at your last edit position in Vim.
Plug 'powerman/vim-plugin-AnsiEsc'         " ansi escape sequences concealed, but highlighted as specified (conceal)
Plug 'Shougo/vimproc.vim'                  " Interactive command execution in Vim.
Plug 'tpope/vim-apathy'                    " apathy.vim: Set the 'path' option for miscellaneous file types
Plug 'tpope/vim-fugitive'                  " a Git wrapper so awesome, it should be illegal http://www.vim.org/scripts/script.php?script_id=2975
Plug 'tpope/vim-obsession'                 " obsession.vim: continuously updated session files
Plug 'tpope/vim-rhubarb'                   " GitHub extension for fugitive.vim
Plug 'tpope/vim-sleuth'                    " sleuth.vim: Heuristically set buffer options
Plug 'vimwiki/vimwiki'                     " Personal Wiki for Vim http://vimwiki.github.io/

" Languages
Plug 'Absolight/vim-bind'                  " DNS Bind zone & named plugin
Plug 'Glench/Vim-Jinja2-Syntax'            " An 'up-to-date' jinja2 syntax file.
Plug 'adimit/prolog.vim'
Plug 'chikamichi/mediawiki.vim'            " Syntax highlighting for MediaWiki-based projects, such as Wikipedia.
Plug 'chr4/nginx.vim'                      " Improved nginx vim plugin (incl. syntax highlighting)
Plug 'chrisbra/unicode.vim'
Plug 'dag/vim-fish'
Plug 'davidhalter/jedi-vim'                " Jedi-vim is a Vim binding to the awesome Python autocompletion library `jedi`.
Plug 'derekwyatt/vim-scala'
Plug 'm-kat/aws-vim'                       " aws-vim
Plug 'momota/junos.vim'                    " Vim syntax for Junos configuration files
Plug 'plasticboy/vim-markdown'
Plug 'rhysd/vim-crystal'                   " Vim filetype and tools support for Crystal language. http://crystal-lang.org/
Plug 'tpope/vim-scriptease'                " scriptease.vim: A Vim plugin for Vim plugins
Plug 'w0rp/ale'                            " Asynchronous Lint Engine

"" Languages - English
Plug 'amperser/proselint'                  " Proselint plugin for Vim
Plug 'beloglazov/vim-online-thesaurus'     " A Vim plugin for looking up words in an online thesaurus

"" Languages - Haskell
Plug 'eagletmt/ghcmod-vim'                 " Happy Haskell programming on Vim, powered by ghc-mod
Plug 'eagletmt/neco-ghc'                   " A completion plugin for Haskell, using ghc-mod http://www.vim.org/scripts/script.php?script_id=3423
Plug 'hspec/hspec.vim'                     " Vim syntax file for Hspec
Plug 'lukerandall/haskellmode-vim'
Plug 'raichoo/haskell-vim'
Plug 'Twinside/vim-hoogle'                 " Vim plugin used to query hoogle, the haskell search engine
Plug 'Twinside/vim-syntax-haskell-cabal'   " Syntax file for Haskell's cabal syntax file
Plug 'vim-scripts/hlint'                   " Compiler definition for the hlint (haskell checker) tool

"" Languages - Ruby
Plug 'danchoi/ri.vim'                      " browse ri documentation from Vim http://github.com/danchoi/ri.vim
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'                   " endwise.vim: wisely add end in ruby, endfunction/endif/more in vim script, etc http://www.vim.org/scripts/script.php?script_id=2386
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'vim-ruby/vim-ruby'

"" Languages - Web Dev
Plug 'cakebaker/scss-syntax.vim'           " Vim syntax file for scss (Sassy CSS)
Plug 'gregsexton/MatchTag'                 " Vim's MatchParen for HTML tags http://www.vim.org/scripts/script.php?script_id=3818
Plug 'leafgarland/typescript-vim'          " Typescript syntax files for Vim
Plug 'mattn/emmet-vim'                     " emmet for vim: http://emmet.io/ http://mattn.github.io/emmet-vim
Plug 'pangloss/vim-javascript'             " Vastly improved Javascript indentation and syntax support in Vim.
Plug 'ternjs/tern_for_vim'                 " Tern plugin for Vim
Plug 'tmhedberg/matchit'                   " extended % matching for HTML, LaTeX, and many other languages

" Navigation
Plug 'majutsushi/tagbar'                   " Vim plugin that displays tags in a window, ordered by scope http://majutsushi.github.com/tagbar
Plug 'mbbill/undotree'                     " Visualise undo tree
Plug 'scrooloose/nerdtree'                 " A tree explorer plugin for vim.
Plug 'vim-utils/vim-vertical-move'         " Move to bottom of text easily
Plug 'wesQ3/vim-windowswap'                " Swap two panes in Vim
Plug 'wincent/command-t'                   " Fast file navigation for VIM
Plug 'Xuyuanp/nerdtree-git-plugin'

" Text Editing
Plug 'ervandew/supertab'                   " Tab completion with Tab
Plug 'godlygeek/tabular'                   " Align text; like these comments
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
  Plug 'vim-pandoc/vim-pandoc'             " pandoc integration and utilities for vim
  Plug 'vim-pandoc/vim-pandoc-syntax'      " pandoc markdown syntax, to be installed alongside vim-pandoc
  Plug 'Quramy/tsuquyomi'                  " A Vim plugin for TypeScript
endif

" Plugins requiring async support
if v:version >= 800
  Plug 'drzel/vim-in-proportion'           " Resize vim's containing window and your splits resize proportionally
  Plug 'metakirby5/codi.vim'               " The interactive scratchpad for hackers.
  Plug 'ramele/agrep'                      " Asynchronous grep plugin for Vim
endif

if has('lua')
  Plug 'Shougo/neocomplete.vim'            " Next generation completion framework after neocomplcache
endif

if has('mac')
  Plug 'vim-scripts/MailApp'               " This plugin allows Mac OS X users to send e-mails from Vim using Mail.app.
endif

" After
Plug 'ryanoasis/vim-devicons'              " Adds font icons (glyphs ★♨☢) to programming languages, libraries,
                                           " and web developer filetypes for: NERDTree, powerline, vim-airline,
                                           " ctrlp, unite, lightline.vim, vim-startify, vimfiler, and flagship

call plug#end()
