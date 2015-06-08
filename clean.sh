#!/bin/bash

rcs=(
  ${HOME}/.vimrc
  ${HOME}/.tmux.conf
)

dirsToDelete=(
  ${HOME}/.config/bash
  ${HOME}/.config/vim
  ${HOME}/.config/tmux
  ${HOME}/.config/powerline
)

for i in ${rcs[*]}; do
  rm -v $i
done

for i in ${dirsToDelete[*]}; do
  rm -vrf $i
done
