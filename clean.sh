#!/usr/bin/env bash

files=(
  vimrc
  tmux
)

declare -A rcs=(
  ["vimrc"]="${HOME}/.vimrc"
  ["tmux"]="${HOME}/.tmux.conf"
)

declare -A src=(
  ["vimrc"]="src/rcfiles/vimrc"
  ["tmux"]="src/rcfiles/tmux.conf"
)

dirsToDelete=(
  ${HOME}/.config/bash
  ${HOME}/.config/powerline
  ${HOME}/.config/tmux
  ${HOME}/.vim
)

for file in ${files[*]}; do
  # rm -v $i
  while read line; do
    comm -2 -3 "${rcs["$file"]}" "${src["$file"]}" > "/tmp/$file"
    mv "/tmp/$file" "${rcs["$file"]}"
  done < "${src["$file"]}"
done

for i in ${dirsToDelete[*]}; do
  echo "removing $i"
  rm -rf $i
done
