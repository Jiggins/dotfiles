#!/bin/sh

PATH="${PATH}:/usr/local/bin"
tmux attach -t 'Hotkey' || tmux new -s 'Hotkey'
