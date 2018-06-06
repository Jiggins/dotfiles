#!/bin/bash

LOGFILE="log/$(date +%Y-%m-%d)-install.log"

# Logging
mkdir ${VERBOSE} -p log
date > "${LOGFILE}"

function log {
  while read -r line; do
    if [[ "${VERBOSE+x}" ]] || [[ ! -z $1 ]]; then
      echo -e "${line}" | tee -a "${LOGFILE}"
    else
      echo -e "$line" >> "${LOGFILE}"
    fi
  done
}

# Checks if a command is installed
function commandExists {
  return $(command -v "$1" > /dev/null)
}

# $1: File to prepend (Will appear at the top of $2)
# $2: File to prepend to (output file)
function prependFile {
  if [[ ! $# -eq 2 ]]; then
    echo 'prependFile expects two arguments:'
    echo '  $1: File to prepend (Will appear at the top of $2)'
    echo '  $2: File to prepend to (output file)'
    return 1
  elif [[ ! -e $2 ]]; then
    echo "linking $1 to $2" | log -s
    ln -s "$1" "$2"
  else
    echo -e "Prepending $1 to $2" | log -s
    cp "$1" tmp
    cat "$2" >> tmp
    mv tmp "$2"
  fi

  return 0
}

# Colours and text formatting
BOLD="$(tput bold)"; export BOLD
RED="$(tput setaf 1)"; export RED
GREEN="$(tput setaf 2)"; export GREEN
YELLOW="$(tput setaf 3)"; export YELLOW
BLUE="$(tput setaf 4)"; export BLUE
PURPLE="$(tput setaf 5)"; export PURPLE
LIGHTBLUE="$(tput setaf 6)"; export LIGHTBLUE
WHITE="$(tput setaf 7)"; export WHITE
GREY="$(tput setaf 8)"; export GREY
RESET="$(tput sgr0)"; export RESET
CLEARLN="\\r$(tput el)"; export CLEARLN

function info() {
  echo -e "${BOLD}${*}${RESET}"
}

function success() { info "${GREEN}${*}"; }
function warn()    { info "${YELLOW}${*}"; }
function error()   { info "${RED}${*}"; }
