let $VIMHOME=expand('<sfile>:p:h').'/.vim'

" Override vimrc with OS specific options
if has('mac')
  source $VIMHOME/macos.vim
elseif has('linux')
  source $VIMHOME/linux.vim
endif


