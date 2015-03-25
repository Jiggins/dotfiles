#! /bin/bash

#set -x
while getopts "l:" opt; do
    case "$opt" in
    l)  LOCAL=1
        ;;
    esac
done

VIM_DIR='test/vim'
VIMRC='test/vimrc'

# Mac OSX (Darwin) uses `.bash_profile`, everything else uses `.bashrc`
if [[ ${LOCAL} -eq 1 ]]; then
  BASH_DIR='test/.bash'
  BASHRC="test/.bashrc"
else
  BASH_DIR="${HOME}/.bash"
  case `uname` in
    'Darwin')
      BASHRC="${HOME}/.bash_profile"
      ;;
    *)
      BASHRC="${HOME}/.bashrc"
  esac
fi

# Copy bash stuff
mkdir -p ${BASH_DIR}
cp src/bash/* ${BASH_DIR}

# Prepend src/bashrc to the existing .bashrc or .bash_profile
if [ -e ${BASHRC} ]; then
  # Backup bashrc incase something goes wrong
  cp ${BASHRC} ${BASHRC}.bak
else
  touch ${BASHRC}
fi

grep -q 'source ${HOME}/.bash/aliases'  ${BASHRC} && patched=true
if [[ ! $patched ]]; then
  cat ${BASHRC} > ./tmp
  cat src/bashrc >> ./tmp
  mv ./tmp ${BASHRC}
fi

source ${BASHRC}

# inputrc - I like Vim mode input

function copyInputrc {
  echo 'copying inputrc'
  cp src/inputrc ${HOME}/.inputrc
}

if [ ! $INPUTRC ]; then
  if [ -e ${HOME}/.inputrc ] && diff src/inputrc ${HOME}/.inputrc > /dev/null; then
    echo 'inputrc already exists, do you want to overwite?'
    read input
    case ${input} in
      y | Y | yes)
        copyInputrc
        shift
        ;; 
      *)
        ;;
    esac
  fi
fi

# Vim stuff

# Install vundle
mkdir -p ${VIM_DIR}/bundle
if [ ! -e  ${VIM_DIR}/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ${VIM_DIR}/bundle/vundle
fi

