#!/usr/bin/env bash

set -eu
set -o pipefail

declare -r output_dir="${VIDEOS_DIR:-${HOME}/Videos/source}"
mkdir -p "${output_dir}"

# Encode video for Davinci Resolve. As usual the Arch wiki has all the answers:
# https://wiki.archlinux.org/title/DaVinci_Resolve#Workaround_for_DaVinci_Resolve_Free
function encodeVideo() {
  local video="${1}"
  local output_file="${output_dir}/$(basename "${video%.MP4}").mov"

  local -a ffmpeg_input_args=(
    # Decode MP4 on the GPU
    -hwaccel cuda
    -hwaccel nvdec
  )

  local -a ffmpeg_output_args=(
    # Use Apple Lossless audio codec
    # Davinci Resolve does not like AAC
    -c:a alac

    # Use DNxHD video codec, which is supported by Davinci Resolve free version
    -c:v dnxhd
    -profile:v dnxhr_hqx
    -pix_fmt yuv422p10le
  )

  time ffmpeg -y \
    -i "${video}" \
    "${ffmpeg_output_args[@]}" \
    "${output_file}"

  ls -lh "${1}" "${output_file}"
}

for video in "${@}"; do
  encodeVideo "${video}"
done
