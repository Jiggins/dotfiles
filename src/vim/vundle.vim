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
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

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
Plugin 'kien/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'vim-utils/vim-vertical-move'
Plugin 'wesQ3/vim-windowswap'

" Text Editing
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/vim-emoji'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-utils/vim-space'

" tmux Integration
Plugin 'benmills/vimux'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jpalardy/vim-slime'
Plugin 'tmux-plugins/vim-tmux-focus-events'

call vundle#end()

if has('autocmd')
  filetype plugin indent on
endif
