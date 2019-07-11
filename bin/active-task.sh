#!/bin/bash

set -eu

# requires task warrior
command -v task >/dev/null || exit 1

task_id=$(task +ACTIVE _ids | head -n 1)
time=$(timew | sed -n 's/ *Total *//p')

# If there are active tasks, use taskwarrior
if [[ -n "${task_id}" ]]; then
  echo -n " ${task_id}  $(task _get ${task_id}.description)  ${time} "
  exit 0
fi

task=$(timew | sed -n 's/Tracking "*\([^"]*\)"*$/\1/p')

if [[ -z "${task}" ]]; then
  exit 1
fi

echo -n " ${task}  ⌚️ ${time} "
