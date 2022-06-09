if ! command -v tmux > /dev/null; then
  return 0
fi

alias ta='tmux attach -t'
alias tl='tmux list-sessions'

function tn() {
  local target_dir="${1:-$PWD}"
  local session_name

  if [[ "${target_dir}" = "${HOME}" ]]; then
    session_name='Local'
  else
    session_name=${target_dir##*/}
  fi

  if [[ -d "${1}" ]]; then
    cd "${1}"
  fi

  tmux attach -t "${session_name}" || tmux new -s "${session_name}"
}
