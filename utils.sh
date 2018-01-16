LOGFILE="log/$(date +%Y-%m-%d)-install.log"

# Logging
mkdir ${VERBOSE} -p log
date > ${LOGFILE}

function log {
  while read line; do
    if [ ${VERBOSE+x} ] || [ ! -z ${1} ]; then
      echo -e "$line" | tee -a $LOGFILE
    else
      echo -e "$line" >> $LOGFILE
    fi
  done
}

# Checks if a command is installed
function commandExists {
  return $(command -v $1 > /dev/null)
}

# $1: File to prepend (Will appear at the top of $2)
# $2: File to prepend to (output file)
function prependFile {
  if [ ! $# -eq 2 ]; then
    echo 'prependFile expects two arguments:'
    echo '  $1: File to prepend (Will appear at the top of $2)'
    echo '  $2: File to prepend to (output file)'
    return 1
  elif [ ! -e $2 ]; then
    echo -e "Copying $1 to $2" | log
    cp $1 $2
  else
    echo -e "Prepending $1 to $2" | log
    cp $1 tmp
    cat $2 >> tmp
    mv tmp $2
  fi

  return 0
}

# Colours and text formatting
export BOLD="$(tput bold)"
export RED="$(tput setaf 1)"
export GREEN="$(tput setaf 2)"
export YELLOW="$(tput setaf 3)"
export BLUE="$(tput setaf 4)"
export PURPLE="$(tput setaf 5)"
export LIGHTBLUE="$(tput setaf 6)"
export WHITE="$(tput setaf 7)"
export GREY="$(tput setaf 8)"
export RESET="$(tput sgr0)"
export CLEARLN="\r$(tput el)"

function info() {
  echo -en "${BOLD}${@}"
  echo -e  "${RESET}"
}

function success() { info "${GREEN}${1}"; }
function warn()    { info "${YELLOW}${1}"; }
function error()   { info "${RED}${1}"; }
