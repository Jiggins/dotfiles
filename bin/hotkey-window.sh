#!/bin/sh

PATH="${PATH}:/opt/homebrew/bin:/usr/local/bin"
exec tmux new-session -A -s 'Hotkey' -c "${HOME}"
