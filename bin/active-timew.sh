#!/bin/bash

set -eu

# requires task warrior
command -v timew >/dev/null || exit 1

task=$(timew | sed -n 's/Tracking "\(.*\)"/\1/p')
time=$(timew | sed -n 's/ *Total *//p')

if [[ -z "${task}" ]]; then
  exit 0
fi

echo -n " ${time} ${task} "
