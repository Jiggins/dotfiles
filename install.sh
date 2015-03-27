#! /bin/sh

#set -x
while getopts "l:" opt; do
    case "$opt" in
    l)  LOCAL=1
        ;;
    esac
done

# Mac OSX (Darwin) uses `.bash_profile`, everything else uses `.bashrc`
if [[ ${LOCAL} -eq 1 ]]; then
  BASH_DIR='test/.bash'
  BASHRC='test/.bashrc'
  GITCONFIG='test/.gitconfig'
  VIM_DIR='test/vim'
  VIMRC='test/vimrc'
else
  BASH_DIR="${HOME}/.bash"
  GITCONFIG="${HOME}/.gitconfig"
  VIM_DIR="${HOME}/.vim"
  VIMRC="${HOME}/.vimrc"

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
  else
    copyInputrc
  fi
fi

function copyGitconfig {
  echo 'copying gitconfig'
  cp src/gitconfig ${HOME}/.gitconfig
}

if [ ! $INPUTRC ]; then
  if [ -e ${HOME}/.gitconfig ] && diff src/gitconfig ${HOME}/.gitconfig > /dev/null; then
    echo 'gitconfig already exists, do you want to overwite?'
    read input
    case ${input} in
      y | Y | yes)
        copyGitconfig
        shift
        ;;
      *)
        ;;
    esac
  else
    copyGitconfig
  fi
fi


# Vim stuff
mkdir -p ${VIM_DIR}

# Prepend src/virc to the existing .vimrc
if [ -e ${VIMRC} ]; then
  # Backup vimrc incase something goes wrong
  cp ${VIMRC} ${VIMRC}.bak
else
  touch ${VIMRC}
fi

grep -q 'source vundle' ${VIMRC} && vpatched=true
if [[ ! $vpatched ]]; then
  cat ${VIMRC} > ./tmp
  cat src/vimrc >> ./tmp
  mv ./tmp ${VIMRC}
fi

# Install vundle
cp src/vim/* ${VIM_DIR}
vi +PluginInstall +qall

