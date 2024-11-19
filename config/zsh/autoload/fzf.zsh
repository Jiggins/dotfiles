# FZF

eval "$(fzf --zsh)"

if command -v fd > /dev/null; then
  export FZF_DEFAULT_COMMAND="fd --type file --color=always"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_DEFAULT_OPTS="--ansi"

  # Use fd (https://github.com/sharkdp/fd) instead of the default find
  # command for listing path candidates.
  # - The first argument to the function ($1) is the base path to start traversal
  # - See the source code (completion.{bash,zsh}) for the details.
  _fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
  }

  # Use fd to generate the list for directory completion
  _fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
  }

  if command -v bat > /dev/null; then
    export FZF_CTRL_T_OPTS="${FZF_DEFAULT_OPTS} --preview '[[ -f {} ]] && bat --style grid --color always {}'"
  else
    export FZF_CTRL_T_OPTS="${FZF_DEFAULT_OPTS} --preview '[[ -f {} ]] && cat {}'"
  fi
fi

# https://github.com/junegunn/fzf-git.sh
source "${ZSH_CONFIG_DIR}/zplug/repos/junegunn/fzf-git.sh/fzf-git.sh"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf "$@" --preview 'tree -C {} | head -200' ;;
    export|unset) fzf "$@" --preview "eval 'echo \$'{}" ;;
    ssh)          fzf "$@" --preview 'dig +noall, +answer {}' ;;
    vim)          fzf "$@" --preview '[[ -f {} ]] && bat --style grid --color always {}' ;;
    *)            fzf "$@" ;;
  esac
}
