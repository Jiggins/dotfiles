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
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'SirVer/ultisnips'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'

" Removing You Complete Me,  to many dependancies
"Plugin 'Valloric/YouCompleteMe'

call vundle#end()

if has('autocmd')
  filetype plugin indent on
endif
