#!/bin/bash

set -eu

# requires task warrior
command -v task >/dev/null || exit 1

for id in $(task +ACTIVE _ids | head -n 3); do
  echo -n " ${id}  $(task _get ${id}.description) "
done
