function hyperlink() {
  local text="${1}"
  local url="${2}"

  if [[ -t 1 ]]; then
    printf '\033]8;;%s\033\\%s\033]8;;\033\\\n' "${url}" "${text}"
  else
    printf '[%s](%s)\n' "${text}" "${url}"
  fi
}
