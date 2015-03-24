#! /bin/bash

BASHRC='~/.basrc'
BASH_DIR='test/.bash'
VIM_DIR='test/vim'
VIMRC='test/vimrc'
LOCAL=true

# Mac OSX (Darwin) uses `.bash_profile`, everything else uses `.bashrc`
if $LOCAL then
  $BASHRC='./bashrc'
else
  case `uname` in
    'Darwin')
      $BASHRC='~/.bash_profile'
      ;;
    *)
      $BASHRC='~/.bashrc'
  esac
fi

# Copy bash stuff
mkdir -p ${BASH_DIR}
cp src/bash/* ${BASH_DIR}

# Append src/bashrc to the existing .bashrc or .bash_profile
if [ -w ${BASHRC} ]
then
  cat src/bashrc <(cat ${BASHRC}) > ${BASHRC}
  source ${BASHRC}
fi

# Install vundle
mkdir -p ${VIM_DIR}/bundle
git clone https://github.com/gmarik/vundle.git ${VIM_DIR}/bundle/vundle


