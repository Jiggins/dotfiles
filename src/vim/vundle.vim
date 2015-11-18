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

Plugin 'gmarik/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'benmills/vimux'
Plugin 'chrisbra/unicode.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'derekwyatt/vim-scala'
Plugin 'dermusikman/sonicpi.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/tabular'
Plugin 'jpalardy/vim-slime'
Plugin 'junegunn/vim-emoji'
Plugin 'kien/ctrlp.vim'
Plugin 'lukerandall/haskellmode-vim'
Plugin 'mbbill/undotree'
Plugin 'plasticboy/vim-markdown'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'raichoo/haskell-vim'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-utils/vim-space'
Plugin 'vim-utils/vim-vertical-move'
Plugin 'wesQ3/vim-windowswap'

call vundle#end()

if has('autocmd')
  filetype plugin indent on
endif
