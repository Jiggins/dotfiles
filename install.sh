#! /bin/bash


#LOCAL=false

#while getopts :l-: i; do
#  case "$i" in
#    l)
#      LOCAL=true
#      ;;
#    --)
#      shift
#      break
#      ;;
#    *)
#      echo "Not implemented: $1" >&2
#      exit 1
#      ;;
#  esac
#done

if [ "$1" == "--local" ]; then
  LOCAl=true
else
  LOCAl=false
fi

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

# Append src/bashrc to the existing .bashrc or .bash_profile
if [ ! -e ${BASHRC} ]; then
  touch ${BASHRC}
fi

cat ${BASHRC} > ./tmp
cat src/bashrc >> ./tmp
mv ./tmp ${BASHRC}

source ${BASHRC}

# Install vundle
mkdir -p ${VIM_DIR}/bundle
if [ ! -e  ${VIM_DIR}/bundle/vundle ]; then
  git clone https://github.com/gmarik/vundle.git ${VIM_DIR}/bundle/vundle
fi

