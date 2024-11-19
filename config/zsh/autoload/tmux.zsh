if ! command -v tmux > /dev/null; then
  return 0
fi

alias ta='tmux attach -t'
alias tl='tmux list-sessions'

function _choose_tmux_workspace_dir() {
  printf "%s\n" "${TMUX_WORKSPACES[@]}" \
    | fzf --query "${1:-}" --exit-0 --select-1 \
      --scheme path \
      --delimiter '/' --with-nth -1 \
      --preview 'echo -e "{}\n"; git -c color.status=always -C {} status; printf "\n\n"; bat --color always {}/README.md'
}

function tn() {
  local target_dir
  local session_name

  if (( $# == 0 )); then
    target_dir="${PWD}"
  else
    while (( $# > 0 )); do
      case "${1}" in
        -l)
          echo "${TMUX_WORKSPACES[@]##*/}"
          return 0
          ;;

        -p)
          shift

          if (( ${#TMUX_WORKSPACES[@]} < 1 )); then
            echo "Please set TMUX_WORKSPACES[@] and try again"
            return 1
          fi

          target_dir=$(_choose_tmux_workspace_dir "${1:-}")
          break
          ;;

        *)
          target_dir="${1}"
          ;;
      esac

      shift
    done
  fi

  if [[ -z "${target_dir}" ]]; then
    echo 'No directory selected' >&2
    return 1
  fi

  if [[ "${target_dir}" = "${HOME}" ]]; then
    session_name='Local'
  else
    session_name=${target_dir##*/}
  fi

  if [[ -n "${TMUX}" ]]; then
    if ! tmux list-sessions -F '#S' | grep --silent "${session_name}"; then
      tmux new-session -d -s "${session_name}" -c "${target_dir}"
    fi

    tmux switch-client -t "${session_name}"
    return $?
  fi

  tmux new-session -A -s "${session_name}" -c "${target_dir}"
}
