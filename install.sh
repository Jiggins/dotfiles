#! /bin/bash

VIM_DIR='test/vim'
VIMRC='test/vimrc'

# Install vundle
mkdir -p ${VIM_DIR}/bundle
git clone https://github.com/gmarik/vundle.git ${VIM_DIR}/bundle/vundle


