if ! command -v tmux > /dev/null; then
  return 0
fi

alias ta='tmux attach -t'
alias tl='tmux list-sessions'

function tn() {
  [[ "$PWD" = "$HOME" ]] && (tmux attach -t "Local" || tmux new -s "Local") && return 0
  local dirname=${PWD##*/}
  local name=${1:-${dirname}}

  tmux attach -t "$name" || tmux new -s "$name"
}
