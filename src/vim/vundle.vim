" `<sfile>` gives the location of the current file being sourced
" `:p` gives full path rather than relative
" `:h` knocks off the last item in the path
let $VIMHOME=expand('<sfile>:p:h')

if !exists(':PluginInstall')
  if !isdirectory(expand("$VIMHOME/bundle/Vundle.vim/.git"))
    !git clone https://github.com/VundleVim/Vundle.vim.git $VIMHOME/bundle/Vundle.vim
  endif
endif

set nocompatible
filetype off

set rtp+=$VIMHOME/bundle/Vundle.vim
call vundle#begin("$VIMHOME/bundle")

" Package Manager
Plugin 'VundleVim/Vundle.vim'

" Aesthetics
Plugin 'airblade/vim-gitgutter'                                   " Show git diff in gutter
Plugin 'junegunn/limelight.vim'                                   " :flashlight: All the world's indeed a stage and we are merely players
Plugin 'kien/rainbow_parentheses.vim'                             " Better Rainbow Parentheses

" Colourschemes
Plugin 'altercation/vim-colors-solarized'                        " precision colorscheme for the vim text editor http://ethanschoonover.com/solarized
Plugin 'widatama/vim-phoenix'                                    " Monochrome color schemes for Vim
Plugin 'romainl/flattened'                                       " Solarized, without the bullshit.

" General
Plugin 'Shougo/vimproc.vim'                                      " Interactive command execution in Vim.
Plugin 'ramele/agrep'                                            " Asynchronous grep plugin for Vim
Plugin 'tpope/vim-fugitive'                                      " a Git wrapper so awesome, it should be illegal http://www.vim.org/scripts/script.php?script_id=2975
Plugin 'tpope/vim-obsession'                                     " obsession.vim: continuously updated session files
Plugin 'tpope/vim-rhubarb'                                       " GitHub extension for fugitive.vim

" Languages
Plugin 'Absolight/vim-bind'                                      " DNS Bind zone & named plugin
Plugin 'adimit/prolog.vim'
Plugin 'chrisbra/unicode.vim'
Plugin 'dag/vim-fish'
Plugin 'derekwyatt/vim-scala'
Plugin 'evanmiller/nginx-vim-syntax'                             " nginx vim syntax. Copied from http://www.vim.org/scripts/script.php?script_id=1886
Plugin 'metakirby5/codi.vim'                                     " The interactive scratchpad for hackers.
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/syntastic'                                    " Syntax checking hacks for vim
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

"" Languages - English
Plugin 'amperser/proselint'                                      " Proselint plugin for Vim
Plugin 'beloglazov/vim-online-thesaurus'                         " A Vim plugin for looking up words in an online thesaurus

"" Languages - Haskell
Plugin 'eagletmt/ghcmod-vim'                                     " Happy Haskell programming on Vim, powered by ghc-mod
Plugin 'eagletmt/neco-ghc'                                       " A completion plugin for Haskell, using ghc-mod http://www.vim.org/scripts/script.php?script_id=3423
Plugin 'hspec/hspec.vim'                                         " Vim syntax file for Hspec
Plugin 'lukerandall/haskellmode-vim'
Plugin 'raichoo/haskell-vim'
Plugin 'Twinside/vim-hoogle'                                     " Vim plugin used to query hoogle, the haskell search engine
Plugin 'Twinside/vim-syntax-haskell-cabal'                       " Syntax file for Haskell's cabal syntax file
Plugin 'vim-scripts/hlint'                                       " Compiler definition for the hlint (haskell checker) tool

"" Languages - Ruby
Plugin 'dermusikman/sonicpi.vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'                                       " endwise.vim: wisely add end in ruby, endfunction/endif/more in vim script, etc http://www.vim.org/scripts/script.php?script_id=2386
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'vim-ruby/vim-ruby'

"" Languages - Web Dev
Plugin 'cakebaker/scss-syntax.vim'                               " Vim syntax file for scss (Sassy CSS)
Plugin 'gregsexton/MatchTag'                                     " Vim's MatchParen for HTML tags http://www.vim.org/scripts/script.php?script_id=3818
Plugin 'mattn/emmet-vim'                                         " emmet for vim: http://emmet.io/ http://mattn.github.io/emmet-vim
Plugin 'pangloss/vim-javascript'                                 " Vastly improved Javascript indentation and syntax support in Vim.
Plugin 'ternjs/tern_for_vim'                                     " Tern plugin for Vim

" Navigation
Plugin 'majutsushi/tagbar'                                       " Vim plugin that displays tags in a window, ordered by scope http://majutsushi.github.com/tagbar
Plugin 'mbbill/undotree'                                         " Visualise undo tree
Plugin 'scrooloose/nerdtree'                                     " A tree explorer plugin for vim.
Plugin 'vim-utils/vim-vertical-move'                             " Move to bottom of text easily
Plugin 'wesQ3/vim-windowswap'                                    " Swap two panes in Vim
Plugin 'wincent/command-t'                                       " Fast file navigation for VIM
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Text Editing
Plugin 'ervandew/supertab'                                       " Tab completion with Tab
Plugin 'godlygeek/tabular'                                       " Align text; like these comments
Plugin 'inkarkat/argtextobj.vim'                                 " Text-object like motion for arguments http://www.vim.org/scripts/script.php?script_id=2699
Plugin 'junegunn/vim-emoji'                                      " Vim support for Emoji
Plugin 'terryma/vim-multiple-cursors'                            " Create multiple cursors in Vim
Plugin 'tomtom/tcomment_vim'                                     " Comment a line with gcc
Plugin 'tpope/vim-characterize'                                  " Print the unicode value of the character under the cursor - ga
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'                                   " use CTRL-A/CTRL-X to increment dates, times, and more http://www.vim.org/scripts/script.php?script_id=2120
Plugin 'tpope/vim-surround'                                      " Surround text with a character or brackets
Plugin 'vim-utils/vim-space'                                     " Select in and around whitespace
Plugin 'wellle/targets.vim'                                      " Vim plugin that provides additional text objects

" tmux Integration
Plugin 'benmills/vimux'                                          " Open a tmux session from Vim
Plugin 'christoomey/vim-tmux-navigator'                          " Move between Vim and tmux panes with one short cut
Plugin 'jpalardy/vim-slime'                                      " Copy text to repl in tmux
Plugin 'tmux-plugins/vim-tmux-focus-events'                      " Fix for FocusGained and FocusLost autocommand events in tmux.
Plugin 'tpope/vim-tbone'                                         " tmux basics http://www.vim.org/scripts/script.php?script_id=4488

if has('lua')
  Plugin 'Shougo/neocomplete.vim'                                " Next generation completion framework after neocomplcache
endif

if has('python') || has('python3')
  Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}  " Powerline - The triangular characters in Vim and tmux
endif

" After
Plugin 'ryanoasis/vim-devicons'                                   " Adds font icons (glyphs ★♨☢) to programming languages, libraries,
                                                                  " and web developer filetypes for: NERDTree, powerline, vim-airline,
                                                                  " ctrlp, unite, lightline.vim, vim-startify, vimfiler, and flagship

call vundle#end()

if has('autocmd')
  filetype plugin indent on
endif
