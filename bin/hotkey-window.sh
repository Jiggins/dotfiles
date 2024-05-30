#!/bin/sh

PATH="${PATH}:/opt/homebrew/bin:/usr/local/bin"
tmux attach -t 'Hotkey' || tmux new -s 'Hotkey'
