" Use the system clipboard as the default clipboard if vim is running in a tmux session with the name 'Hotkey'. I
" usually use this as a kind of scratch pad and usually set this manually. For regular usage, this is pretty annoying.
if !empty($TMUX) && trim(system("tmux display-message -p '#S'")) == 'Hotkey'
  set clipboard=unnamed
endif
