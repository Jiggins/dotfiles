# FZF
if command -v fd > /dev/null; then
  export FZF_DEFAULT_COMMAND="fd --type file --color=always"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS="--ansi"

  # if command -v bat > /dev/null; then
  #   export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --preview '[[ -f {} ]] && bat --style grid --color always {}' --preview-window down:10"
  # fi
fi
