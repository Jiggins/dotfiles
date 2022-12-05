#!/usr/bin/env bash

set -eu

# requires task warrior
command -v task >/dev/null || exit 1

# BSD sed on Mac is not as good as GNU sed. If GNU sed is installed, use that
if command -v gsed >/dev/null; then
  sed_cmd='gsed'
fi

sed_cmd="${sed_cmd:-sed}"

function parse_task_from_timew() {
  # Only parse first line
  # Remove "Tracking"
  # Remove quotes
  # Remove tags (starting with +)
  # Remove extra whitespace
  ${sed_cmd} -n \
    -e '1!d' \
    -e '/^Tracking/!d' \
    -e 's/Tracking //' \
    -e 's/"//g' \
    -e 's/+[[:alnum:]]*\b//g' \
    -e 's/^ *//' \
    -e 's/ *$//p'
}

task_id=$(task +ACTIVE _ids | head -n 1)

if [[ -n "${task_id}" ]]; then
  task_description=$(task _get "${task_id}.description")
else
  task_description=$(timew | parse_task_from_timew)
fi

time=$(timew | ${sed_cmd} -n 's/ *Total *//p')

function stoptask() {
  if [[ -n "${task_id}" ]]; then
    task "${task_id}" stop
    return $?
  fi

  timew stop
}

function resumetask() {
  readarray -t previous_tracked_time < <(timew get dom.tracked.1.json | jq -r '.tags[]')
  readarray -t matching_tasks < <(task status:pending "/${previous_tracked_time[*]}/" export | jq '.[].id')

  if (( ${#matching_tasks[@]} > 0 )); then
    task "${matching_tasks[@]}" start
    return $?
  fi

  timew continue
}

function touchbar() {
  local -a output=( "${task_id}" )

  if [[ -n "${task_description}" ]]; then
    output+=( "${task_description}" )
  fi

  if [[ -n "${time}" ]]; then
    output+=( ⌚️ "${time}" )
  fi

  if (( ${#output[@]} == 0 )); then
    echo 'task'
  else
    echo "${output[*]}"
  fi
}

function tmuxline() {
  if [[ -n "${task_id}" ]]; then
    echo -n " ${task_id}  ${task_description}  ⌚️ ${time} "
    return $?
  fi

  if [[ -n "${task_description}" ]]; then
    echo -n " ${task_description}  ⌚️ ${time} "
    return $?
  fi
}

while (( $# > 0 )); do
  case "${1}" in
    --id)
      echo "${task_id}"
      ;;

    --resume)
      resumetask
      ;;

    --stop)
      stoptask
      ;;

    --touchbar)
      touchbar
      ;;

    --tmux)
      tmuxline
      ;;
  esac

  shift
done
