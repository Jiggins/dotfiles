#¡/usr/bin/env bash

set -eu

declare tmpfile='/tmp/images.json'
declare export_dir="${EXPORT_DIR:-${HOME}/Desktop/images}"
mkdir -p "${export_dir}"

# find "${@}" -type f -name '*.ARW' -exec exiftool -json -Rating {} + > "${tmpfile}"

# declare -a images=( $(jq -r '.[] | select(.Rating > 0).SourceFile' "${tmpfile}") )

# rsync -av "${images[@]}" "${export_dir}"

function makeGif() {
  local -a images=()
  local start_recording=false

  while read rating source_file; do
    if [[ "${rating}" == 2 ]]; then
      echo "started at ${source_file}"
      start_recording=true
    fi

    if [[ "${rating}" == 3 ]]; then
      echo "Stopped at ${source_file}"
      images+=( "${source_file}" )
      break
    fi

    if [[ "${start_recording}" == true ]]; then
      images+=( "${source_file}" )
    fi
  done < <(jq -r '.[] | [.Rating, .SourceFile] | @tsv' "${tmpfile}")
  echo "${#images[@]}"

  set -x
  time magick -verbose "${images[@]}" -delay 5 -loop 0 -resize '20%' "${export_dir}/output.mp4"
}

makeGif "${@}"
