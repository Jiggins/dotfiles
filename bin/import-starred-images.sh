#¡/usr/bin/env bash

set -eux

declare tmpfile='/tmp/images.json'
declare export_dir="${EXPORT_DIR:-${HOME}/Desktop/images}"
mkdir -p "${export_dir}"

find "${@}" -type f -name '*.HIF' -exec exiftool -json -Rating {} + > "${tmpfile}"

declare -a images=( $(jq -r '.[] | select(.Rating > 0).SourceFile' "${tmpfile}") )

rsync -av "${images[@]}" "${export_dir}"
