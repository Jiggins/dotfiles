" `<sfile>` gives the location of the current file being sourced
" `:p` gives full path rather than relative
" `:h` knocks off the last item in the path
"let $VIMHOME=expand('<sfile>:p:h')
if !exists(':PluginInstall')
  let $VIMHOME=expand('~')

  if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  endif
endif

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("~/.vim/bundle")

" Package Manager
Plugin 'gmarik/Vundle.vim'

" Aesthetics
Plugin 'airblade/vim-gitgutter'                                  " Show git diff in gutter
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'} " Powerline - The triangular characters in Vim and tmux

" Languages
Plugin 'chrisbra/unicode.vim'
Plugin 'derekwyatt/vim-scala'
Plugin 'dermusikman/sonicpi.vim'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'raichoo/haskell-vim'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-rails'

" Navigation
Plugin 'kien/ctrlp.vim'                                          " Search for files in Vim
Plugin 'mbbill/undotree'                                         " Visualise undo tree
Plugin 'vim-utils/vim-vertical-move'                             " Move to bottom of text easily
Plugin 'wesQ3/vim-windowswap'                                    " Swap two panes in Vim

" Text Editing
Plugin 'ervandew/supertab'                                       " Tab completion with Tab
Plugin 'godlygeek/tabular'                                       " Align text; like these comments
Plugin 'junegunn/vim-emoji'                                      " Vim support for Emoji
Plugin 'terryma/vim-multiple-cursors'                            " Create multiple cursors in Vim
Plugin 'tomtom/tcomment_vim'                                     " Comment a line with gcc
Plugin 'tpope/vim-characterize'                                  " Print the unicode value of the character under the cursor - ga
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'                                      " Surround text with a character or brackets
Plugin 'vim-utils/vim-space'                                     " Select in and around whitespace

" tmux Integration
Plugin 'benmills/vimux'                                          " Open a tmux session from Vim
Plugin 'christoomey/vim-tmux-navigator'                          " Move between Vim and tmux panes with one short cut
Plugin 'jpalardy/vim-slime'                                      " Copy text to repl in tmux
Plugin 'tmux-plugins/vim-tmux-focus-events'                      " Fix for FocusGained and FocusLost autocommand events in tmux.

call vundle#end()

if has('autocmd')
  filetype plugin indent on
endif
