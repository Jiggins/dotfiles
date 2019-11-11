# Task Warrior

if ! command -v task > /dev/null; then
  return 0
fi

alias n='task ready'
alias nn="task project:${CURRENT_PROJECT}"

function review() {
  description="Review ${1}"
  [[ -n "${2}" ]] && description+=" for ${2}"
  shift; shift

  task add scheduled:today ${@} "${description}" \
    || return $?

  task reviews
}
