# FZF

eval "$(fzf --zsh)"

if command -v fd > /dev/null; then
  export FZF_DEFAULT_COMMAND="fd --type file --color=always"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS="--ansi"

  if command -v bat > /dev/null; then
    export FZF_CTRL_T_OPTS="${FZF_DEFAULT_OPTS} --preview '[[ -f {} ]] && bat --style grid --color always {}'"
  else
    export FZF_CTRL_T_OPTS="${FZF_DEFAULT_OPTS} --preview '[[ -f {} ]] && cat {}'"
  fi
fi

# https://github.com/junegunn/fzf-git.sh
source "${ZSH_CONFIG_DIR}/zplug/repos/junegunn/fzf-git.sh/fzf-git.sh"
