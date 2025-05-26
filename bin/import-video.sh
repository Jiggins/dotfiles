#!/usr/bin/env bash

set -euo pipefail

declare -r videos_dir="${VIDEO_DIR:-${HOME}/Videos}"
declare -ra sdcard=( $(find /run/media/jack -mindepth 1 -maxdepth 1 -type d) )

if (( ${#sdcard[@]} < 1 )); then
  echo "No SD card mounted" 2>&1
  exit 2
fi

function importVideos() {
  local -a exif_tags=(
    -FileName
    -FileType
    -CreateDate
    -DeviceManufacturer
    -DeviceModelName
    -Model
  )

  exiftool -s "${exif_tags[@]}" -json "${@}" \
    | jq -r \
      --arg videos_dir "${videos_dir}" \
      'def cameraByManufacturer(f): if f | .DeviceManufacturer then [.DeviceManufacturer, .DeviceModelName] | join("-") else empty end;
      def djiCamera(f): f | if .FileName | startswith("DJI") then "DJI" else empty end;
      map(select(.FileType != "MacOS") | . * {
        "Date": .CreateDate | split(" ")[0] | gsub(":"; "-"),
        "Camera": ( .Model // cameraByManufacturer(.) // djiCamera(.)) | gsub(" "; "-")
      } | {
        SourceFile,
        "Directory": [$videos_dir, .Date, .Camera // "Unkown"] | join("/")
      }) | group_by(.Directory)[] | [.[0].Directory, .[].SourceFile] | join(" ")' \
    | while read -a output; do
      local output_directory="${output[0]}"
      local source_files="${output[@]:1}"
      mkdir -p "${output_directory}"

      mv -ivu --target-directory="${output_directory}" ${source_files[@]}
  done
}

function moveXmlSidecars() {
  local input_dir="${1}"
  local manufacturer
  local model

  find "${input_dir}" -type f -name '*.XML' | while read xml; do
    manufacturer=$(xpath -q -e '/NonRealTimeMeta/Device/@manufacturer' "${xml}" | cut -d '"' -f 2)
    model=$(xpath -q -e '/NonRealTimeMeta/Device/@modelName' "${xml}" | cut -d '"' -f 2)
    create_date=$(xpath -q -e '/NonRealTimeMeta/CreationDate/@value' "${xml}" | cut -d '"' -f 2 | cut -d 'T' -f 1)

    if [[ -z "${manufacturer}" ]]; then
      echo "Could not determine camera model for ${xml}" >&2
      continue
    fi

    new_path="${videos_dir}/${create_date}/${manufacturer}-${model}"
    mkdir -p "${new_path}"
    mv -v --target-directory="${new_path}" "${xml}" 
  done
}

importVideos $(find "${sdcard}" -type f -regex ".*\.\(MP4\|360\)$")
moveXmlSidecars "${sdcard}"
