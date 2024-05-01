if ! command -v tmux > /dev/null; then
  return 0
fi

alias ta='tmux attach -t'
alias tl='tmux list-sessions'
#
# function tn() {
#   local target_dir="${1:-$PWD}"
#   local session_name
#
#   if [[ "${target_dir}" = "${HOME}" ]]; then
#     session_name='Local'
#   else
#     session_name=${target_dir##*/}
#   fi
#
#   if [[ -d "${1}" ]]; then
#     cd "${1}"
#   fi
#
#   tmux attach -t "${session_name}" || tmux new -s "${session_name}"
# }

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
        -p)
          shift

          if (( ${#TMUX_WORKSPACES[@]} < 1 )); then
            echo "Please set TMUX_WORKSPACES[@] and try again"
            return 1
          fi

          target_dir=$(_choose_tmux_workspace_dir "${1:-}")
          ;;

        *)
          target_dir="${1}"
          ;;
      esac

      shift
    done
  fi

  if [[ "${target_dir}" = "${HOME}" ]]; then
    session_name='Local'
  else
    session_name=${target_dir##*/}
  fi

  if [[ -d "${target_dir}" ]]; then
    cd "${target_dir}"
  fi

  tmux attach -t "${session_name}" || tmux new -s "${session_name}"
}
