#!/bin/bash

function info() { echo "$(tput setaf 2)INFO:$(tput sgr0) ${*}"; }
function warn() { echo "$(tput setaf 3)WARN:$(tput sgr0) ${*}"; }
function error() { echo "$(tput setaf 1)ERROR:$(tput sgr0) ${*}"; }
function running() { echo "$(tput setaf 4)RUNNING:$(tput sgr0) ${*}"; }
function bold() { echo "$(tput bold)${*}$(tput sgr0)"; }

function die() {
  local return_value=$?
  echo "$(tput setaf 1)FATAL:$(tput sgr0) ${*}"
  exit "${return_value}"
}

function decolour() {
  sed 's/\x1b\[[0-9;]*m//g'
  return $?
}

function choose() {
  fzf --height 10 "${@}"
}

function ask() {
  if [[ -n "${REPLY:-}" ]]; then
    unset REPLY
  fi

  if [[ -n "${ZSH_VERSION:-}" ]]; then
    vared -p "${*} y[n] " -c REPLY
  else
    read -p "${*} y[n] " -n 1
    echo
  fi

  [[ "${REPLY}" =~ ^[Yy]$ ]]
}

function join_with() {
  local delimiter=$1; shift
  echo -n "${1}"; shift
  printf "%s" "${@/#/$delimiter}"
}
