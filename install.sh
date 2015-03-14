#! /bin/bash

BASH_DIR='test/.bash'
VIM_DIR='test/vim'
VIMRC='test/vimrc'

# Copy bash stuff
mkdir -p ${BASH_DIR}
cp src/bash/* ${BASH_DIR}

# Append src/bashrc to the existing .bashrc or .bas_profile


# Install vundle
mkdir -p ${VIM_DIR}/bundle
git clone https://github.com/gmarik/vundle.git ${VIM_DIR}/bundle/vundle


